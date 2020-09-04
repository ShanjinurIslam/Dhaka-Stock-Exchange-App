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
        let temp:[MyShare] = MySharesDatabase.shared.getMyShares()
        DispatchQueue.main.async {
            self.myShares = temp
        }
    }
    
    var body: some View {
        List{
            MySharesHeader()
            ForEach(self.myShares,id: \.self.id){myShare in
                NavigationLink(destination:ProfitLossView(myShare: myShare)){
                    MySharesRow(myShare: myShare)
                }
            }
        }
        .onAppear(perform: onLoad)
        .navigationBarTitle("My Shares",displayMode: .large)
    }
}

struct MySharesView_Previews: PreviewProvider {
    static var previews: some View {
        MySharesView()
    }
}
