//
//  CompanyDataProvider.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class CompanyDataProvider:ObservableObject{
    @Published var points:[(String,Double)] = []
    @Published var isLoading:Bool = true
    
    func getData(name:String,type:String,duration:String) {
        let data_api_url:String = "https://dsexchange.herokuapp.com/api/company_data?name=\(name)&type=\(type)&duration=\(duration)"
        
        print(data_api_url)
        let url = URL(string:data_api_url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode([CData].self,from: data){
                    
                    var temp:[(date: String, type: Double)] = []
                    for each in decoded{
                        temp += [(each.date,Double(each.data)!)]
                    }
                    DispatchQueue.main.async {
                        self.points.removeAll()
                        self.points.append(contentsOf: temp)
                        print(self.points)
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
