//
//  CarListDetailView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct CarListDetailView: View {
    
    @EnvironmentObject var carsViewModel: CarsViewModel
    
    var car: Car
    
    var body: some View {
        
//        NavigationLink(destination: CarDetailView(car: car)) {
            VStack {
                // MARK: IMAGE
                PictureView(pictureUrl: car.picture_url!,
                            pictureSize: 0.75)
                
                // MARK: CAR INFO
                HStack {
                    // Car breand and model
                    Text(car.brand! + " " + car.model!)
                        .bold()
                    
                    Spacer()
                    
                    // Car price per day
                    Text("\(car.price_per_day!) €/j")
                        .italic()
                        .font(.subheadline)
                }
                .padding(.trailing)
                .padding(.leading)
                
                
                // MARK: CAR RATINGS
                HStack(alignment: .bottom, spacing: 1) {
                    
                    // Ratings Stars
                    RatingStarsView(ratingAverage: car.rating.average!)
                    
                    // # of ratings
                    Text("(\(car.rating.count!))")
                        .font(.caption)
                        .padding(.leading, 5)
                    
                    Spacer()
                }
                .padding(.trailing)
                .padding(.leading)
                
            }
            .padding(.top)
            .padding(.bottom)
//        }
    }
}



struct CarListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarListDetailView(car: Car.test_car)
    }
}
