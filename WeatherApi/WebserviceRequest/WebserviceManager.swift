//
//  WebserviceManager.swift
//  WeatherApi
//
//  Created by Narayanasamy on 29/09/23.
//
import Foundation

class WeatherService {
    
    private let apiKey = "b9056370815a48fe4dfd3aad918dac0e"
    let baseURL = URLType.weather.urlString

    func fetchWeatherData(forCity city: String, completion: @escaping (Result<WeatherModel, Error>) -> Void) {
        // Create the URL with the required query parameters
        var components = URLComponents(string: baseURL)!
        components.queryItems = [
            URLQueryItem(name: "q", value: city),
            URLQueryItem(name: "appid", value: apiKey),
            URLQueryItem(name: "units", value: "metric") // You can adjust units as needed
        ]
        // Create the URLSession request
        let request = URLRequest(url: components.url!)

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            do {
                let decoder = JSONDecoder()
                let weatherData = try decoder.decode(WeatherModel.self, from: data)
                completion(.success(weatherData))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}

