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
        provider.getAllCompanies()
    }
    
    var body: some View {
        List{
            ForEach(provider.companies) {company in
                NavigationLink(destination:CompanyDetailsView()){
                    Text(company.name)
                }
            }
        }
        .onAppear(perform: onLoad)
        .navigationBarTitle("List of Companies")
    }
}

struct CompanyListView_Previews: PreviewProvider {
    static var previews: some View {
        CompanyListView()
    }
}
