//
//  AddVehicleInfoView.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 29/05/24.
//

import SwiftUI

struct AddVehicleInfoView: View {
    @Binding var isSecondaryScreenPresented: Bool
    @StateObject private var viewModel = AddVehicleInfoViewModel()

    var body: some View {
        VStack(spacing: 20) {
            navBar
            ScrollView {
                VStack (spacing: 8) {
                    CustomTextField(title: "Select Imei", style: .qrCode, dropDownItem: [])
                    CustomTextField(title: "Tag Name", style: .simple)
                    CustomTextField(title: "Registration Number", style: .simple)
                    CustomTextField(title: "Vehicle type", style: .menu,dropDownItem: viewModel.makeVehicleTypeData())
                    CustomTextField(title: "Make", style: .menu, dropDownItem: viewModel.makeVehicleMake())
                    CustomTextField(title: "Year of Manufacture", style: .menu, dropDownItem: viewModel.makeVehicleYearOfManufacture())
                    CustomTextField(title: "Fuel Type", style: .menu, dropDownItem: viewModel.makeVehicleFuelType())
                    CustomTextField(title: "Capacity", style: .menu, dropDownItem: viewModel.makeVehicleCapacity())
                    CustomTextField(title: "Driver", style: .simple)
                }
            }
            Spacer()
            addButton
        }
        .background(Color.gray.opacity(0.1))
        .toolbar(.hidden, for: .navigationBar)
        .onAppear {
            viewModel.fetchVehicleData()
        }
    }

    private var navBar: some View {
        HStack {
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
}
