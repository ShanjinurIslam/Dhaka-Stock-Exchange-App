//
//  LatestPrice.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

struct Stock:Identifiable,Codable{
    let id = UUID()
    let TRADING_CODE:String
    let LTP:String
    let HIGH:String
    let LOW:String
    let CLOSEP:String
    let YCP:String
    let CHANGE:String
    let TRADE:String
    let VALUE:String
    let VOLUME:String
    
}

struct Stocks:Codable{
    var stocks: [Stock] = [Stock]()
}
