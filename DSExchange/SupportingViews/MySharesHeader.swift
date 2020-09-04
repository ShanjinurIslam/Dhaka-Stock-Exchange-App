//
//  MyShareHeader.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct MySharesHeader: View {
    var body: some View {
        HStack{
            Text("Company").frame(width: 120)
            Spacer()
            Text("Total").frame(width: 120)
            Spacer()
            Text("Saleable").frame(width: 120)
            Spacer()
            Text("Cost").frame(width: 120)
            Spacer()
            Text("Total Cost").frame(width: 120)
        }.padding()
    }
}
