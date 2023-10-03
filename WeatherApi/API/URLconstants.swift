//
//  URLconstants.swift
//  WeatherApi
//
//  Created by Narayanasamy on 30/09/23.
//

import Foundation

enum APIError: Error {
    case invalidURL
    // Add more cases for other API-related errors as needed
}
enum URLType {
    case weather // Add more cases for other URLs as needed

    var urlString: String {
        switch self {
        case .weather:
            return "https://api.openweathermap.org/data/2.5/weather"
        // Add cases and URLs for other endpoints
        }
    }
    
    func asURL() throws -> URL {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }
        return url
    }
}
