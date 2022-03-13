//
//  PictureView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct PictureView: View {
    
    var pictureUrl: String
    var pictureSize: Double
    
    var body: some View {
        
        let width = UIScreen.main.bounds.width*pictureSize
        let height = width*9/16
        
        if pictureUrl != "" {
            // From iOS 15 the method AsyncImage is available for images from URL
            if #available(iOS 15.0, *) {
                AsyncImage(
                    url: URL(string: pictureUrl),
                    content: { image in
                        image
                            .resizable()
                            .scaledToFit()
                    }, placeholder: {
                        Color.gray
                    })
                    .frame(width: width, height: height)
                    .mask(RoundedRectangle(cornerRadius: 5))
            } else {
                // to do: method for iOS version < 15.0
                Image(systemName: "car")
                    .frame(width: width, height: height)
            }
        } else {
            // If car picture url does not exist
            Image(systemName: "car")
                .frame(width: width, height: height)
        }
    }
}

struct PictureView_Previews: PreviewProvider {
    static var previews: some View {
        PictureView(pictureUrl: Car.test_car.picture_url!, pictureSize: 0.8)
    }
}
