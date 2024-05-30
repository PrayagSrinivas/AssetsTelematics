//
//  VehicleData.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 29/05/24.
//

import Foundation

struct VehicleData: Codable {
    let status: Int?
    let message: String?
    let vehicleType, vehicleCapacity, vehicleMake, manufactureYear: [VehicleContent]?
    let fuelType: [VehicleContent]?

    enum CodingKeys: String, CodingKey {
        case status, message
        case vehicleType = "vehicle_type"
        case vehicleCapacity = "vehicle_capacity"
        case vehicleMake = "vehicle_make"
        case manufactureYear = "manufacture_year"
        case fuelType = "fuel_type"
    }    
    init() {
        self.status = nil
        self.message = nil
        self.vehicleType = nil
        self.vehicleCapacity = nil
        self.vehicleMake = nil
        self.manufactureYear = nil
        self.fuelType = nil
    }
}

// MARK: - FuelType
struct VehicleContent: Codable {
    let text: String
    let value: Int
    let images: String
}
