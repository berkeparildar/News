//
//  Weather.swift
//  News
//
//  Created by Berke Parıldar on 26.06.2024.
//

import Foundation

struct WeatherInfo: Decodable {
    let main: String
}

struct WeatherDegree: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let weather: [WeatherInfo]
    let main: WeatherDegree
}
