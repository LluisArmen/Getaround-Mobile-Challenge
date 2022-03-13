//
//  CarDetailView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct CarDetailView: View {
    
    var car: Car
    
    var body: some View {
        
        ScrollView {
            VStack {
                // MARK: CAR IMAGE
                PictureView(pictureUrl: car.picture_url!,
                               pictureSize: 1.0)
                
                
                // MARK: CAR INFO
                HStack {
                    // Car breand and model
                    Text(car.brand! + " " + car.model!)
                        .font(.title2)
                        .bold()
                    
                    Spacer()
                    
                    // Car price per day
                    Text("\(car.price_per_day!) €/j")
                        .italic()
                        .font(.title3)
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
                
                
                // MARK: OWNER
                HStack {
                    Text("Owner")
                        .font(.title2)
                        .bold()
                    Spacer()
                }
                .padding(.leading)
                .padding(.top, 50)
                
                HStack(alignment: .bottom, spacing: 1) {
                    // Owner Picture
                    PictureView(pictureUrl: car.owner.picture_url!,
                                   pictureSize: 0.2)
                        .padding(.trailing, 5)
                
                    VStack(alignment: .leading) {
                        // Owner Name
                        Text(car.owner.name!)
                        
                        // Owner Ratings Stars
                        RatingStarsView(ratingAverage: car.owner.rating.average!)
                    }
                    
                    Spacer()
                }
                .padding(.trailing)
                .padding(.leading)
            }
        }
        .navigationBarTitle("")
    }
}

struct CarDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CarDetailView(car: Car.test_car)
    }
}
