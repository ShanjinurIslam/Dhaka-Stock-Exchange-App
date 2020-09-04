//
//  CompanyListView.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import SwiftUI

struct CompanyListView: View {
    @ObservedObject var provider:CompanyListProvider = CompanyListProvider()
    
    func onLoad(){
        if(!provider.loaded){
            provider.getAllCompanies()
        }
    }
    
    var body: some View {
        List{
            if(provider.loaded){
                ForEach(provider.companies) {company in
                    NavigationLink(destination:CompanyDetailsView(name:company.name)){
                        Text(company.name)
                    }
                }
            }
            else{
                EmptyView()
            }
        }
        .onAppear(perform: onLoad)
        .animation(.spring())
        .navigationBarTitle("List of Companies")
        .navigationBarItems(trailing: self.provider.loaded ? Button("Reload"){
            self.provider.loaded = false
            self.provider.getAllCompanies()
        } : Button(""){
            
        })
    }
}

struct CompanyListView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListView()
    }
}
