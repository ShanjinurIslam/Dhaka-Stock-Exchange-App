//
//  CompanyDetailsView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct CompanyDetailsView: View {
    let types = ["price","vol","ttg"]
    let showing_types = ["Price","Volume","Total Trade Graph"]
    let durations = ["1","3","6","9","12","24"]
    
    
    @State var type:Int = 0
    @State var duration:Int = 0
    
    @State var addFlag:Bool = false
    @State var showGraph:Bool = false
    @ObservedObject var provider:CompanyDetailsProvider = CompanyDetailsProvider()
    var name:String
    
    func onLoad() {
        provider.getDetails(name: name)
    }
    
    var body: some View {
        VStack(alignment: provider.isLoading ? .center : .leading){
            if(provider.isLoading){
                ActivityIndicator()
            }
            else{
                Form{
                    HStack{
                        Text("Market Information").bold().font(.title)
                        Spacer()
                    }.padding()
                    MarketInfoView(marketInfo: provider.companyDetails.market_info).padding()
                    HStack{
                        Text("Basic Information").bold().font(.title)
                        Spacer()
                    }.padding()
                    BasicInfoView(basicInfo: provider.companyDetails.basic_info).padding()
                
                    Section(header:Text("Graph Type")){
                        Picker("",selection:self.$type){
                            ForEach(0 ..< showing_types.count,id:\.self) {
                                Text("\(self.showing_types[$0])")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    Section(header:Text("Duration (Months)")){
                        Picker("",selection:self.$duration){
                            ForEach(0 ..< durations.count,id:\.self) {
                                Text("\(self.durations[$0])")
                            }
                        }
                        .labelsHidden()
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button("View"){
                        self.showGraph = true
                    }
                }
                Spacer()
            }
        }
        .sheet(isPresented: self.$addFlag, onDismiss: {
            self.addFlag = false
        }){
            AddShareView(companyName:self.name,dispose: self.$addFlag)
        }
        .sheet(isPresented: self.$showGraph, onDismiss: {
            self.showGraph = false
        }){
            GraphView(name:self.name,type: self.types[self.type],duration: self.durations[self.duration], show_type: self.showing_types[self.type])
        }
        .onAppear(perform:onLoad)
        .navigationBarTitle(name)
        .navigationBarItems(trailing:  Button(action:{
            if(!self.provider.isLoading){
                self.addFlag = true
            }
        }){
            Image(systemName: "plus").foregroundColor(self.provider.isLoading ? .gray : .blue )
        })
            
    }
}

