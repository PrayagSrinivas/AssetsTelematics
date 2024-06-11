//
//  VehilceRadioButtonView.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 11/06/24.
//

import SwiftUI

struct VehicleRadioButtons: View {
    
    // Call back properties for radio button action
    let callback: (String) -> ()
    
    @State var selectedId: Vehicle = .own
    
    // MARK: Primary View and UI Components.
    var body: some View {
        HStack(spacing: 20) {
            radioOwn
            radioTransporter
            Spacer()
        }
    }
    
    private var radioOwn: some View {
        RadioButtonField(
            id: Vehicle.own.rawValue,
            label: Vehicle.own.rawValue,
            isMarked: selectedId.rawValue == Vehicle.own.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    private var radioTransporter: some View {
        RadioButtonField(
            id: Vehicle.transporter.rawValue,
            label: Vehicle.transporter.rawValue,
            isMarked: selectedId.rawValue == Vehicle.transporter.rawValue ? true : false,
            callback: radioGroupCallback
        )
    }
    
    private func radioGroupCallback(id: String) {
        selectedId = Vehicle(rawValue: id)!
        callback(id)
    }
}
