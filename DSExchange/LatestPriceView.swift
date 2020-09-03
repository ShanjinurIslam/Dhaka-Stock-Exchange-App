//
//  LatestPriceView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct LatestPriceView: View {
    @ObservedObject var provider:LatestPriceProvider = LatestPriceProvider()
    
    func loadAPI(){
        provider.getLatestPrices()
    }
    
    var body: some View {
        List{
            HStack{
                HStack{
                    Text("Trading Code").bold()
                    Spacer()
                }.frame(width: 120)
                Spacer()
                Spacer()
                HStack{
                    Text("LTP").bold()
                    Spacer()
                }.frame(width: 120)
                Spacer()
                HStack{
                    Text("HIGH").bold()
                    Spacer()
                }.frame(width: 120)
                Spacer()
                HStack{
                    Text("LOW").bold()
                    Spacer()
                }.frame(width: 120)
                Spacer()
                HStack{
                    Text("CLOSEP").bold()
                    Spacer()
                }.frame(width: 140)
            }
            ForEach(provider.stocks.stocks){stock in
                NavigationLink(destination: CompanyDetailsView()){
                    HStack{
                        HStack{
                            Text(stock.TRADING_CODE)
                            Spacer()
                        }.frame(width: 120)
                        Spacer()
                        Spacer()
                        HStack{
                            Text(stock.LTP)
                            Spacer()
                        }.frame(width: 120)
                        Spacer()
                        HStack{
                            Text(stock.HIGH)
                            Spacer()
                        }.frame(width: 120)
                        Spacer()
                        HStack{
                            Text(stock.LOW)
                            Spacer()
                        }.frame(width: 120)
                        Spacer()
                        HStack{
                            Text(stock.CLOSEP)
                            Spacer()
                        }.frame(width: 120)
                    }
                }
            }
        }
        .onAppear(perform: loadAPI)
        .navigationBarTitle("Latest Price")
    }
}

struct LatestPriceView_Previews: PreviewProvider {
    static var previews: some View {
        LatestPriceView()
    }
}
