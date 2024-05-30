//
//  HomeView.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 28/05/24.
//

import SwiftUI

struct HomeView: View {
    @State private var isSecondaryScreenPresented: Bool = false
    
    var body: some View {
        NavigationStack {
            Button{
                isSecondaryScreenPresented = true
            } label: {
                Image(systemName: "plus")
                    .font(.system(size: 30))
                    .foregroundStyle(.black)
            }
            .buttonStyle(.bordered)
            .navigationTitle("Assets Telematics")
            .navigationDestination(isPresented: $isSecondaryScreenPresented) {
                AddVehicleInfoView(isSecondaryScreenPresented: $isSecondaryScreenPresented)
            }
        }
    }
}
