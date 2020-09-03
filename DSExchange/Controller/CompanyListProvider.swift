//
//  CompanyListProvider.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class CompanyListProvider:ObservableObject{
    @Published var companies:[Company] = [Company]()
    
    func getAllCompanies(){
        let latest_price_api_url:String = "https://dsexchange.herokuapp.com/api/company_list"
        
        let url = URL(string: latest_price_api_url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([Company].self,from: data){
                    DispatchQueue.main.async {
                        self.companies = decoded
                    }
                    return
                }
                else{
                    print("Decode Failed")
                }
            }
        }.resume()
    }
}
