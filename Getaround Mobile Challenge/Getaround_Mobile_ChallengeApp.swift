//
//  Getaround_Mobile_ChallengeApp.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import SwiftUI

@main
struct Getaround_Mobile_ChallengeApp: App {
    
    // The cars view model is added here as a state object in order to be accessible from the whole app
    @StateObject var carsViewModel = CarsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(carsViewModel)
        }
    }
}
