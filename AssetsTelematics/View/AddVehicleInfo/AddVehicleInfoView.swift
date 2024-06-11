//
//  AddVehicleInfoView.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 29/05/24.
//

import CodeScanner
import SwiftUI

struct AddVehicleInfoView: View {
    
    // MARK: Properties
    @StateObject private var viewModel = AddVehicleInfoViewModel()
    @Binding var isSecondaryScreenPresented: Bool
    
    @State var isScannerPresented: Bool = false
    @State var qrCodeScannedValue: String = ""
    
    // MARK: Primary View and UI Components.
    var body: some View {
        VStack(spacing: 20) {
            navBar
            scrollableContent
            Spacer()
            addButton
        }
        .background(Color.gray.opacity(0.1))
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            viewModel.fetchVehicleData()
        }
        .sheet(isPresented: $isScannerPresented, content: {
            CodeScannerView(codeTypes: [.qr]) { result in
                switch result {
                case .success(let value):
                    qrCodeScannedValue = value.string
                case .failure(let failure):
                    print(failure.localizedDescription)
                }
            }
        })
    }
    
    private var scrollableContent: some View {
        ScrollView {
            VStack (spacing: 8) {
                formFiledGroup
            }
        }
    }
    
    private var navBar: some View {
        HStack {
            navBarLabel
            Spacer()
        }
    }
    
    private var addButton: some View {
        Button {
            // TODO: Code will be added here.
        } label: {
            Label(
                title: { Text("Add").font(Font.custom("OpenSans-Semibold", size: 16)) },
                icon: { Image(systemName: "plus") }
            )
        }
        .foregroundStyle(.white)
        .frame(height: 45)
        .frame(maxWidth: .infinity)
        .background(Color.pink)
        .cornerRadius(8)
        .padding()
    }
    
    private var formFiledGroup: some View {
        Group {
            CustomTextField(
                value: qrCodeScannedValue,
                title: "Select Imei",
                style: .qrCode,
                onScan: { isScannerPresented = true },
                dropDownItem: [])
            CustomTextField(
                title: "Tag Name",
                style: .simple
            )
            CustomTextField(
                title: "Registration Number",
                style: .simple
            )
            CustomTextField(
                title: "Vehicle type",
                style: .menu,
                dropDownItem: viewModel.makeVehicleTypeData()
            )
            CustomTextField(
                title: "Make",
                style: .menu,
                dropDownItem: viewModel.makeVehicleMake()
            )
            CustomTextField(
                title: "Year of Manufacture",
                style: .menu,
                dropDownItem: viewModel.makeVehicleYearOfManufacture()
            )
            CustomTextField(
                title: "Fuel Type",
                style: .menu,
                dropDownItem: viewModel.makeVehicleFuelType()
            )
            CustomTextField(
                title: "Capacity",
                style: .menu,
                dropDownItem: viewModel.makeVehicleCapacity()
            )
            CustomTextField(
                title: "Driver",
                style: .simple
            )
        }
    }
    
    private var navBarLabel: some View {
        Label(
            title: {
                Text("Add Vehicle")
            }, icon: {
                Button {
                    isSecondaryScreenPresented = false
                } label: {
                    Image(systemName: "arrow.left")
                }
            }
        )
        .font(Font.custom("OpenSans-Bold", size: 16))
        .foregroundStyle(.black)
        .padding(.leading, 10)
    }
}
