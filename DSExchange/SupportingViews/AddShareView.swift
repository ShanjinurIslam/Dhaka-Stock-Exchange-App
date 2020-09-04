//
//  AddShareView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct AddShareView: View {
    var companyName:String
    @Binding var dispose:Bool
    @State private var isLoading:Bool = false ;
    @State private var total:String=""
    @State private var saleable:String=""
    @State private var cost:String=""
    
    var body: some View {
        VStack{
            HStack{
                Button("Cancel"){
                    if(!self.isLoading){
                        self.dispose = false
                    }
                }
                Spacer()
                Text(companyName).font(.title)
                Spacer()
                Button(action:{
                    self.isLoading = true
                    var myShare:MyShare = MyShare()
                    myShare.instrument = self.companyName
                    myShare.total = Int(self.total) ?? 0
                    myShare.saleable = Int(self.saleable) ?? 0
                    myShare.cost = Double(self.cost) ?? 0
                    myShare.totalcost = myShare.cost*Double(myShare.total)
                    myShare = MySharesDatabase.shared.addShare(myshare: myShare)
                    self.dispose = false
                }){
                    Text("Add")
                }
            }.padding()
            Form{
                Section(header: Text("Total Shares")){
                    TextField("Enter amount",text:self.$total).keyboardType(.decimalPad)
                }
                Section(header: Text("Saleable Shares")){
                    TextField("Enter amount",text:self.$saleable).keyboardType(.decimalPad)
                }
                Section(header: Text("Average Cost")){
                    TextField("Enter amount",text:self.$cost).keyboardType(.decimalPad)
                }
            }
        }
    }
}
