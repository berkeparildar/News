//
//  PersonalHeaderViewModel.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import Foundation

class PersonalHeaderViewModel: ObservableObject {
    private let baseURL = URL(string: "https://api.openweathermap.org/data/2.5/weather")!
    @Published var weather: String = ""
    
    init() {
        self.fetchWeather()
    }
    
    func fetchWeather() {
        var fetchComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        fetchComponents?.queryItems = [
            URLQueryItem(name: "lat", value: String(LocationManager.shared.userLocation!.coordinate.latitude)),
            URLQueryItem(name: "lon", value: String(LocationManager.shared.userLocation!.coordinate.longitude)),
            URLQueryItem(name: "units", value: "metric"),
            URLQueryItem(name: "appid", value: "ffa3f936c20f12bea3917f39335deea8"),
        ]
        
        guard let url = fetchComponents?.url else {
            return
        }
        
        print(url)
        
        URLSession.shared.dataTask(with: url) { [weak self] (data, response, error) in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching weather: \(error.localizedDescription)")
                return
            }
            guard let data = data else {
                print("No data received")
                return
            }
            do {
                let decoder = JSONDecoder()
                let response = try decoder.decode(Weather.self, from: data)
                DispatchQueue.main.async {
                    self.weather = String(Int(response.main.temp)) + "°C"
                }
            } catch {
                print("Decoding error: \(error.localizedDescription)")
                return
            }
        }.resume()
    }
    
}
