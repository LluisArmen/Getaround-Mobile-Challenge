//
//  CarsViewModel.swift
//  Getaround Mobile Challenge
//
//  Created by Lluis Armengol on 11/03/2022.
//

import Foundation

class CarsViewModel: ObservableObject {
    
    @Published var cars = [Car]()
    
    // MARK: GET CARS
    /****
     Function to get the cars information from the API and store it into an array of Cars
        --> Optional input: API URL
     */
    func getCars(_ url_in: URL? = nil, completion: @escaping(Bool, String) -> Void) {
        
        print("\n--> Getting cars from API...")
        
        // Get the url of the cars file (json) to be decoded
        let url = url_in == nil ? URL(string: "https://raw.githubusercontent.com/drivy/jobs/master/mobile/api/cars.json") : url_in
        
        // We use the method URLSession to read the url content
        URLSession.shared.dataTask(with: url!) { data, response, error in
            // Check if error
            if let error = error {
                print(error)
                completion(false, error.localizedDescription)
            } else {
                guard let data = data else {
                    return
                }
                do {
                    // Decode the data using JSONDecoder method
                    let decoder = JSONDecoder()
                    let carsData = try decoder.decode([Car].self, from: data)
                    // Since it is asynchronous we mush use closures
                    DispatchQueue.main.async {
                        print("done")
                        self.cars.removeAll()
                        // the published var must be filled in the main thread
                        self.cars = carsData
                        completion(true, "")
                    }
                } catch let decodingError as NSError {
                    print("\n<<< Decode JSON Failed >>>\n \(decodingError)")
                    completion(false, decodingError.localizedDescription)
                }
            }
        }.resume()
        
    }
}
