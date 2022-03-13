//
//  RatingStarsView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct RatingStarsView: View {
    
    var ratingAverage: Double

    var body: some View {
        
        let fullStars = Int(ratingAverage)
        
        HStack {
            // Full Stars
            if fullStars > 0 {
                ForEach((1...fullStars), id: \.self) {_ in
                    Image(systemName: "star.fill")
                }
            }
            
            // Half Stars
            if fullStars < 5 && ratingAverage != 0.0 {
                Image(systemName: "star.leadinghalf.fill")
            }
            
            // Empty Stars
            if ratingAverage == 0.0  {
                Image(systemName: "star")
            }
            
            if fullStars < 4 {
                ForEach((1...4-fullStars), id: \.self) {_ in
                    Image(systemName: "star")
                }
            }
        }
    }
}

struct RatingStarsView_Previews: PreviewProvider {
    static var previews: some View {
        RatingStarsView(ratingAverage: Car.test_car.rating.average!)
    }
}
