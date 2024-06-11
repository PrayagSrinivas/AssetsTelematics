//
//  AddVehicleInfoViewModel.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 30/05/24.
//

import Foundation
import Combine

class AddVehicleInfoViewModel: ObservableObject {
    
    @Published var vehicleData: VehicleData = .init()
    @Published var textFieldValue: String = ""
    @Published var isScannerPresented: Bool = false
    @Published var qrCodeScannedValue: String = ""
    
    private let vehicleService: VehicleService

    init(vehicleService: VehicleService = VehicleService()) {
        self.vehicleService = vehicleService
    }

    func fetchVehicleData() {
        vehicleService.fetchVehicleData { [weak self] result in
            switch result {
            case .success(let vehicleData):
                DispatchQueue.main.async {
                    self?.vehicleData = vehicleData
                }
            case .failure(let error):
                print("Failed to fetch vehicle data: \(error.localizedDescription)")
            }
        }
    }

    func makeVehicleTypeData() -> [MenuTitle] {
        return vehicleData.vehicleType?.map { MenuTitle(title: $0.text) } ?? []
    }

    func makeVehicleMake() -> [MenuTitle] {
        return vehicleData.vehicleMake?.map { MenuTitle(title: $0.text) } ?? []
    }

    func makeVehicleYearOfManufacture() -> [MenuTitle] {
        return vehicleData.manufactureYear?.map { MenuTitle(title: $0.text) } ?? []
    }

    func makeVehicleCapacity() -> [MenuTitle] {
        return vehicleData.vehicleCapacity?.map { MenuTitle(title: $0.text) } ?? []
    }

    func makeVehicleFuelType() -> [MenuTitle] {
        return vehicleData.fuelType?.map { MenuTitle(title: $0.text) } ?? []
    }
}
