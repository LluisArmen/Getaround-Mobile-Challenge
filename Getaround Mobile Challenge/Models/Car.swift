//
//  Car.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import Foundation

// This model follows the same structure and properties than the information from the API

struct Car: Codable, Identifiable {
    
    var id = UUID()
    var brand: String?
    var model: String?
    var picture_url: String?
    var price_per_day: Int?
    var rating: Rating
    var owner: Owner
    
    struct Owner: Codable {
        var name: String?
        var picture_url: String?
        var rating: Rating
    }
    
    struct Rating: Codable {
        var average: Double?
        var count: Int?
    }
    
    private enum CodingKeys: CodingKey {
        case brand
        case model
        case picture_url
        case price_per_day
        case rating
        case owner
    }
    
    
#if DEBUG
    static let test_car = Car(brand: "Citroen",
                              model: "C3",
                              picture_url: "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/pictures/13.jpg",
                              price_per_day: 17,
                              rating: Car.Rating(average: 4.697711, count: 259),
                              owner: Car.Owner(name: "Elmira Sorrell",
                                               picture_url: "https://drivy-assets.imgix.net/jobs/team/howard.jpg",
                                               rating: Car.Rating(average: 4.318206,
                                                                  count: 255)))
#endif
    
}
