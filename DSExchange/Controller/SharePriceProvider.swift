//
//  SharePriceProvider.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/4/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class SharePriceProvider:ObservableObject{
    @Published var isLoading:Bool = true
    @Published var stock:Stock!
    
    func getStockPrice(name:String){
        let stock_price_api_url:String = "https://dsexchange.herokuapp.com/api/share_price?name="+name
        
        let url = URL(string: stock_price_api_url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(Stock.self,from: data){
                    DispatchQueue.main.async {
                        self.stock = decoded
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
