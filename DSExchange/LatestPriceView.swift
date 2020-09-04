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
        if(!provider.loaded){
            provider.getLatestPrices()
        }
    }
    
    var body: some View {
        List{
            if(provider.loaded){
                LatestPriceHeader()
                ForEach(provider.stocks.stocks){stock in
                    LatestPriceRow(stock:stock)
                }
            }
            else{
                EmptyView()
            }
        }
        .animation(.spring())
        .onAppear(perform: loadAPI)
        .navigationBarTitle("Latest Price")
        .navigationBarItems(trailing: self.provider.loaded ? Button("Reload"){
            self.provider.loaded = false
            self.provider.getLatestPrices()
            } : Button(""){
                
            })
    }
}

struct LatestPriceView_Previews: PreviewProvider {
    static var previews: some View {
        LatestPriceView()
    }
}
