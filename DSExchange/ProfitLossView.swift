//
//  ProfitLossView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ProfitLossView: View {
    @ObservedObject var provider:SharePriceProvider = SharePriceProvider()
    var myShare:MyShare
    
    func onLoad(){
        provider.getStockPrice(name: myShare.instrument)
    }
    
    var body: some View {
        VStack{
            if(provider.isLoading){
                Spacer()
                ActivityIndicator()
            }
            else{
                HStack{
                    Text(myShare.instrument).bold().font(.title)
                    Spacer()
                }.padding()
                VStack{
                    HStack{
                        Text("Total Shares")
                        Spacer()
                        Text(String(myShare.total)).bold()
                    }
                    HStack{
                        Text("Saleable Shares")
                        Spacer()
                        Text(String(myShare.saleable)).bold()
                    }
                }.padding()
                ProfitLossRow(stock: provider.stock, myShare: self.myShare)
            }
            Spacer()
        }.onAppear(perform: onLoad)
    }
}
