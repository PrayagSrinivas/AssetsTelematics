//
//  CustomTextField.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 29/05/24.
//

import SwiftUI

struct CustomTextField: View {
    
    // MARK: Properties
    @State var value = ""
    @State var title = ""
    @State var style: CustomTextFieldStyle = .simple
    @Binding var qrCodeScannedValue: String
    
    var onScan:(() -> Void)?
    var dropDownItem: [MenuTitle] = []
    
    // MARK: Initalizers
    init(value: String = "",
         title: String = "",
         style: CustomTextFieldStyle,
         qrCodeScannedValue: Binding<String> = .constant(""),
         onScan: (() -> Void)? = nil,
         dropDownItem: [MenuTitle] = []) {
        self.value = value
        self.title = title
        self.style = style
        self._qrCodeScannedValue = qrCodeScannedValue
        self.onScan = onScan
        self.dropDownItem = dropDownItem
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .foregroundColor(.black)
                .font(Font.custom("OpenSans-Semibold", size: 14))
                .padding(.leading, 20)
            
            textField
                .padding(.horizontal)
        }
    }
    
    private var menuView: some View {
        Menu {
            ForEach(dropDownItem, id: \.id) { item in
                Button(item.title) {
                    self.value = item.title
                }
            }
        } label: {
            menuDropDownButton
        }
    }
    
    private var menuDropDownButton: some View {
        VStack(spacing: 5) {
            Image(systemName: "chevron.down")
                .resizable()
                .foregroundColor(.gray)
                .frame(width: 18, height: 10)
        }
    }
    
    @ViewBuilder
    private var textField: some View {
        switch style {
        case .qrCode:
            HStack {
                commonTextField
                qrCodeButton
            }
        case .simple:
            commonTextField
        case .menu:
            ZStack(alignment: .trailing) {
                commonTextField
                menuButton
            }
        case .radio:
            VehicleRadioButtons { selected in
                print("Selected Owner is: \(selected)")
            }
        }
    }
    
    @ViewBuilder
    private var menuButton: some View {
        menuView
            .padding(.trailing, 10)
    }
    
    private var qrCodeButton: some View {
        Button {
            onScan?()
        } label: {
            qrCodeImage
        }
    }
    
    private var qrCodeImage: some View {
        Image(systemName: "qrcode")
            .resizable()
            .frame(width: 36, height: 36)
            .padding(4.5)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1.5))
            .background(Color.white)
            .foregroundStyle(.black)
    }
    
    private var commonTextField: some View {
        TextField("", text: style == .qrCode ? $qrCodeScannedValue : $value)
            .textFieldStyle(.plain)
            .frame(height: 45)
            .padding(.horizontal, 10)
            .placeholder(when: style == .qrCode ? qrCodeScannedValue.isEmpty : value.isEmpty) {
                Text(dropDownItem.isEmpty ? title : "Select \(title)")
                    .font(Font.custom("OpenSans-Semibold", size: 13))
                    .padding(.horizontal, 10)
                    .foregroundColor(.gray)
            }
            .background(Color.white)
            .cornerRadius(4.0)
            .overlay(RoundedRectangle(cornerRadius: 4).stroke(Color.gray, lineWidth: 1.5))
            .disabled(style == .qrCode || !dropDownItem.isEmpty )
    }
}

enum CustomTextFieldStyle {
    case qrCode
    case simple
    case menu
    case radio
}
