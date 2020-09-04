//
//  MarketInfo.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct MarketInfoView: View {
    var marketInfo:MarketInfo
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Last Trading Price")
                Spacer()
                Text(marketInfo.LTP)
            }
            HStack{
                Text("Closing Price")
                Spacer()
                Text(marketInfo.CP)
            }
            HStack{
                Text("Last Update")
                Spacer()
                Text(marketInfo.LASTUPDATE)
            }
            HStack{
                Text("Day's Range")
                Spacer()
                Text(marketInfo.DR)
            }
            HStack{
                Text("Change Amount")
                Spacer()
                Text(marketInfo.CA)
            }
            HStack{
                Text("Change Percentage")
                Spacer()
                Text(marketInfo.CP)
            }
            HStack{
                Text("Opening Price")
                Spacer()
                Text(marketInfo.OP)
            }
            HStack{
                Text("Adjusted Opening Price")
                Spacer()
                Text(marketInfo.AOP)
            }
            HStack{
                Text("Yesterday's Closing Price")
                Spacer()
                Text(marketInfo.YCP)
            }
        }
    }
}
