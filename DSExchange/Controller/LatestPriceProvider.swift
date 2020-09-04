//
//  LatestPriceProvider.swift
//  DSExchange
//
//  Created by Shanjinur Islam on 9/3/20.
//  Copyright © 2020 Shanjinur Islam. All rights reserved.
//

import Foundation

class LatestPriceProvider:ObservableObject{
    @Published var stocks: Stocks = Stocks()
    @Published var loaded:Bool = false
    
    func getLatestPrices(){
        let latest_price_api_url:String = "https://dsexchange.herokuapp.com/api/latest_price"
        print(latest_price_api_url)
        
        let url = URL(string: latest_price_api_url)!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            if let data = data {
                if let decoded = try? JSONDecoder().decode(Stocks.self,from: data){
                    DispatchQueue.main.async {
                        self.stocks = decoded
                        self.loaded = true
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
