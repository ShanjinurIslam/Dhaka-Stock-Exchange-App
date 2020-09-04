//
//  CompanyDetailsView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct CompanyDetailsView: View {
    @State var addFlag:Bool = false
    @ObservedObject var provider:CompanyDetailsProvider = CompanyDetailsProvider()
    var name:String
    
    func onLoad() {
        provider.getDetails(name: name)
    }
    
    var body: some View {
        VStack(alignment: provider.isLoading ? .center : .leading){
            if(provider.isLoading){
                ActivityIndicator(isLoading: $provider.isLoading)
            }
            else{
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
                Spacer()
            }
        }
        .sheet(isPresented: self.$addFlag, onDismiss: {
            self.addFlag = false
        }){
            AddShareView(companyName:self.name,dispose: self.$addFlag)
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

