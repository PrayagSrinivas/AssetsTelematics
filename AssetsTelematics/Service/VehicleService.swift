//
//  VehicleService.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 30/05/24.
//

import Foundation

enum NetworkError: Error {
    case urlError
    case requestError(Error)
    case noData
    case decodingError(Error)
}

class VehicleService {
    func fetchVehicleData(completion: @escaping (Result<VehicleData, NetworkError>) -> Void) {
        guard let url = URL(string: "http://103.123.173.50:8080/jhsmobileapi/mobile/configure/v1/task") else {
            completion(.failure(.urlError))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let requestBody: [String: Any] = [
            "clientid": 11,
            "enterprise_code": 1007,
            "mno": "9889897789",
            "passcode": 3476
        ]

        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: requestBody, options: [])
        } catch {
            completion(.failure(.requestError(error)))
            return
        }

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(.requestError(error)))
                return
            }

            guard let data = data else {
                completion(.failure(.noData))
                return
            }

            do {
                let decoder = JSONDecoder()
                let vehicleData = try decoder.decode(VehicleData.self, from: data)
                completion(.success(vehicleData))
            } catch {
                completion(.failure(.decodingError(error)))
            }
        }

        task.resume()
    }
}
