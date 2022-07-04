// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let burgerResponse = try? newJSONDecoder().decode(BurgerResponse.self, from: jsonData)

import Foundation

// MARK: - BurgerResponse
struct BurgerResponse: Codable {
    let ref, title, burgerResponseDescription: String
    let thumbnail: String
    let price: Int

    enum CodingKeys: String, CodingKey {
        case ref, title
        case burgerResponseDescription = "description"
        case thumbnail, price
    }
}
