//
//  CarsListView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct CarsListView: View {
    
    @EnvironmentObject var carsViewModel: CarsViewModel
    @State var loadSuccess = false
    @State var errorMessage = ""
    
    var body: some View {
        
        NavigationView {
            
            if loadSuccess {
                // A list is used as a container to show the articles at each row
                List(carsViewModel.cars, id: \.id) {car in
                    // We put each article inside the view ARticlesListView
                    CarListDetailView(car: car)
                }
                .navigationBarTitle(Text("Cars List"))
                .navigationViewStyle(.automatic)

                
            } else {
                // If the info from the API is not loaded, the error message is printed
                Text(errorMessage)
                    .foregroundColor(.red)
                    .padding()
            }
            
        }
        // When the view is loaded, call function to read API and get cars information
        .onAppear {
            carsViewModel.getCars() { success, err in
                if success {
                    loadSuccess = true
                    print("Success")
                    print(carsViewModel.cars)
                } else {
                    print(err)
                    errorMessage = err
                }
            }
        }
        
    }
}

//struct CarsListView_Previews: PreviewProvider {
//    static var previews: some View {
//        CarsListView()
//    }
//}
