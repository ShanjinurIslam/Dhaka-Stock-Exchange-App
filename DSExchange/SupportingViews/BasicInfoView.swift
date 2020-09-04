//
//  BasicInfo.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct BasicInfoView: View {
    var basicInfo:BasicInfo
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("Sector")
                Spacer()
                Text(basicInfo.Sector)
            }
            HStack{
                Text("Authorized Capital (mn)")
                Spacer()
                Text(basicInfo.AC)
            }
            HStack{
                Text("Paid-up Capital (mn)")
                Spacer()
                Text(basicInfo.PC)
            }
            HStack{
                Text("Debut Trading Date")
                Spacer()
                Text(basicInfo.DTD)
            }
            HStack{
                Text("Face/par Value")
                Spacer()
                Text(basicInfo.FACEPV)
            }
            HStack{
                Text("Type of Instrument")
                Spacer()
                Text(basicInfo.TI)
            }
            HStack{
                Text("Market Lot")
                Spacer()
                Text(basicInfo.ML)
            }
        }
    }
}
