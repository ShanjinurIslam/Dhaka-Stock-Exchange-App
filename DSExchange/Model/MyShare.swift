//
//  MyShare.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

struct MyShare {
    var id:Int64
    var instrument:String
    var total:Int
    var saleable:Int
    var cost:Double
    var totalcost:Double
    
    init() {
        id = 0
        instrument = ""
        total = 0
        saleable = 0
        cost = 0
        totalcost = 0
    }
}
