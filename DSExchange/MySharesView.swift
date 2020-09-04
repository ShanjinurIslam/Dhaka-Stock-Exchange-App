//
//  MySharesView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct MySharesView: View {
    @State var myShares:[MyShare] = [MyShare]()
    
    func onLoad(){
        myShares.append(contentsOf: MySharesDatabase.shared.getMyShares())
    }
    
    var body: some View {
        VStack{
            ForEach(self.myShares,id: \.self.id){myShare in
                HStack{
                    Text(myShare.instrument)
                    Spacer()
                    Text(String(myShare.total))
                    Spacer()
                    Text(String(myShare.saleable))
                    Spacer()
                    Text(String(myShare.cost))
                    Spacer()
                    Text(String(myShare.totalcost))
                }.padding()
            }
        }
        .onAppear(perform: onLoad)
        .navigationBarTitle("My Shares")
    }
}

struct MySharesView_Previews: PreviewProvider {
    static var previews: some View {
        MySharesView()
    }
}
