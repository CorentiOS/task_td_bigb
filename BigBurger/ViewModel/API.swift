//
//  API.swift
//  BigBurger
//
//  Created by cgismoove on 04/07/2022.
//

import Foundation

struct API {
    let api = URL(string: "https://uad.io/bigburger/")
    
    func getRemoteData(callbback : (BurgerResponse) -> ()) {
            
            URLSession.shared.dataTask(with: api!) {
                data, response, error in
                if error != nil {
                    print(error ?? "error")
                    return
                }
                do {
                    _ = try JSONDecoder().decode(BurgerResponse.self, from: data!)
                    print("Data OK")
                }
                catch {
                    print("error \(error)")
                }
            }.resume()
        }
}
