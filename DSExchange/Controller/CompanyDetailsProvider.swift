//
//  CompanyDetailsProvider.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class CompanyDetailsProvider:ObservableObject{
    @Published var isLoading:Bool = true
    @Published var companyDetails:CompanyDetails!
    
    func getDetails(name:String){
        
        let details_api_url:String = "https://dsexchange.herokuapp.com/api/company_details?name="+name
        print(details_api_url)
        let url = URL(string:details_api_url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(CompanyDetails.self,from: data){
                    DispatchQueue.main.async {
                        self.companyDetails = decoded
                        self.isLoading = false
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
