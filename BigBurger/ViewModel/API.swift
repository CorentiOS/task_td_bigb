//
//  API.swift
//  BigBurger
//
//  Created by cgismoove on 04/07/2022.
//

import Foundation

struct API {
    let api = URL(string: "https://uad.io/bigburger/")
    
        func getRemoteData() {
            
            URLSession.shared.dataTask(with: api!) {
                data, response, error in
                if error != nil {
                    print(error)
                    return
                }
                do {
                    let result = try JSONDecoder().decode(BurgerResponse.self, from: data!)
                    print(result)
                }
                catch {
                    print("error")
                }
            }.resume()
        }
}
