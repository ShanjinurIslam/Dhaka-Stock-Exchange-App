//
//  MySharesRow.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct MySharesRow: View {
    var myShare:MyShare
    var body: some View {
        HStack{
            Text(myShare.instrument).frame(width: 120)
            Spacer()
            Text(String(myShare.total)).frame(width: 120)
            Spacer()
            Text(String(myShare.saleable)).frame(width: 120)
            Spacer()
            Text(String(myShare.cost)).frame(width: 120)
            Spacer()
            Text(String(myShare.totalcost)).frame(width: 120)
        }.padding()
    }
}
