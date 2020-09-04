//
//  CompanyDetails.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

struct MarketInfo:Codable {
    var LTP:String
    var CLOSEP:String
    var LASTUPDATE:String
    var DR:String
    var CA:String
    var CP:String
    var YEARLYMR:String
    var OP:String
    var DV:String
    var AOP:String
    var DT:String
    var YCP:String
    var MC:String
}

struct BasicInfo:Codable {
    var AC:String
    var DTD:String
    var PC:String
    var TI:String
    var FACEPV:String
    var ML:String
    var TOS:String
    var Sector:String
}

struct CompanyDetails:Codable {
    var market_info:MarketInfo
    var basic_info:BasicInfo
}
