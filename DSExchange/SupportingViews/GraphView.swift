//
//  GraphView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/5/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI
import SwiftUICharts

struct GraphView: View {
    var name:String
    var type:String
    var duration:String
    var show_type:String
    
    @ObservedObject var provider:CompanyDataProvider = CompanyDataProvider()
    
    func onLoad(){
        provider.getData(name: self.name, type: self.type, duration: self.duration)
        print(provider.points)
    }
    
    var body: some View {
        VStack(alignment: provider.isLoading ? .center: .leading ){
            if(provider.isLoading){
                ActivityIndicator()
            }
            else{
                HStack{
                    Text(name).bold().font(.title)
                    Spacer()
                }.padding()
                Spacer()
                HStack{
                    Spacer()
                    BarChartView(data: ChartData(values: provider.points), title: show_type, legend: String(duration + " Months"),form: ChartForm.extraLarge)
                    Spacer()
                }
                Spacer()
            }
        }.onAppear(perform: onLoad)
    }
}
