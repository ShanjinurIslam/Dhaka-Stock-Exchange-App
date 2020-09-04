//
//  LatestPriceRow.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct LatestPriceRow: View {
    var stock:Stock!
    
    var body: some View {
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

