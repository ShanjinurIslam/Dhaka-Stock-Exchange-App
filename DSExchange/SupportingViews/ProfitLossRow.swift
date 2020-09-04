//
//  ProfitLossRow.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ProfitLossRow: View {
    var stock:Stock
    var myShare:MyShare
    
    var body: some View {
        VStack{
            VStack{
                HStack{
                    Text("Buying Rate")
                    Spacer()
                    Text(String(myShare.cost)).bold()
                }
                HStack{
                    Text("Market Rate")
                    Spacer()
                    Text(stock.LTP).bold()
                }
            }.padding()
            VStack{
                HStack{
                    Text("Total Cost")
                        Spacer()
                        Text(String(myShare.totalcost)).bold()
                    }
                    HStack{
                        Text("Market Value")
                        Spacer()
                        Text(String(round(Double(stock.LTP)!*Double(myShare.total)))).bold()
                    }
                    
            }.padding()
            
            HStack{
                Text("Profit/Loss")
                Spacer()
                Text(String(round((Double(stock.LTP)! * Double(myShare.total)) - myShare.totalcost))).bold()
            }.padding()
            
        }
    }
}
