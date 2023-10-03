//
//  WeatherViewModel.swift
//  WeatherApi
//
//  Created by Narayanasamy on 01/10/23.
//

import Foundation

// MARK: - WeatherViewModel
struct WeatherViewModel {
    
    var numberOfWeatherItems: Int {
        return weatherData?.weather?.count ?? 0
    }
    
    private var weatherData: WeatherModel?

    init(weatherData: WeatherModel?) {
        self.weatherData = weatherData
    }

    var cityName: String {
        return weatherData?.name ?? "N/A"
    }

    var cityID: String {
        return "ID: \(weatherData?.id ?? 0)"
    }

    var cityCOD: String {
        return "COD: \(weatherData?.cod ?? 0)"
    }
}
