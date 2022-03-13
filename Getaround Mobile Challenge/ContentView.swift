//
//  ContentView.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var carsViewModel: CarsViewModel
    
    
    var body: some View {
        
        CarsListView()
            .preferredColorScheme(.light)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.light)
    }
}
