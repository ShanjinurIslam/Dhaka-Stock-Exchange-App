//
//  ContentView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            List{
                NavigationLink(destination:LatestPriceView()){
                    HStack{
                        Text("Latest Price")
                        Spacer()
                    }.padding()
                }
                NavigationLink(destination:MySharesView()){
                    HStack{
                        Text("My Shares")
                        Spacer()
                    }.padding()
                }
                NavigationLink(destination:CompanyListView()){
                    HStack{
                        Text("View all")
                        Spacer()
                    }.padding()
                }
            }
            .listRowInsets(EdgeInsets())
            .navigationBarTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
