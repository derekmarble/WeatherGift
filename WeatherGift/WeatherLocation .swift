//
//  WeatherLocation .swift
//  WeatherGift
//
//  Created by Derek Marble on 3/2/22.
//

import Foundation

class WeatherLocation: Codable  {
    var name: String
    var latitude: Double
    var longitude: Double
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
    
    func getData() {
        let urlString = "https://api.openweathermap.org/data/2.5/onecall?lat=\(latitude)&lon=\(longitude)&exclude=minutely&units=imperial&appid=\(APIkeys.openWeatherKey)"
        
        print("We are accessing the URl \(urlString)")
        
        //create a URL
              guard let url = URL(string: urlString) else {
                  print("ERROR: could create a URL from \(urlString)")
                  return
              }
              
         //create session
        let session = URLSession.shared
              
        //get data with data.task method
        let task = session.dataTask(with: url) { data, response, error in
            if let error = error {
                print("ERROR: \(error.localizedDescription)")
            }
        
        
        //deal with the data
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("JSON ERROR: \(error.localizedDescription)")
                
            }
        }
        task.resume()
    }
}
