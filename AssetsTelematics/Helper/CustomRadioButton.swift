//
//  CustomRadioButton.swift
//  AssetsTelematics
//
//  Created by Srinivas Prayag Sahu on 11/06/24.
//

import SwiftUI

//MARK:- Single Radio Button Field
struct RadioButtonField: View {
    
    // MARK: Properties.
    let id: String
    let label: String
    let size: CGFloat
    let color: Color
    let textSize: CGFloat
    let isMarked:Bool
    let callback: (String)->()
    
    // MARK: Initilizer
    init(
        id: String,
        label:String,
        size: CGFloat = 20,
        color: Color = Color.pink,
        textSize: CGFloat = 14,
        isMarked: Bool = false,
        callback: @escaping (String)->()
        ) {
        self.id = id
        self.label = label
        self.size = size
        self.color = color
        self.textSize = textSize
        self.isMarked = isMarked
        self.callback = callback
    }
    
    var body: some View {
        Button {
            self.callback(self.id)
        } label: {
            HStack(alignment: .center, spacing: 10) {
                radioButtonImage
                radioButtonText
                Spacer()
            }
        }
        .foregroundColor(Color.white)
    }
    
    private var radioButtonImage: some View {
        Image(systemName: self.isMarked ? "largecircle.fill.circle" : "circle")
            .renderingMode(.original)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: self.size, height: self.size)
            .foregroundStyle(self.color)
    }
    
    private var radioButtonText: some View {
        Text(label)
            .font(Font.custom("OpenSans-Semibold", size: 13))
            .foregroundStyle(.black)

    }
}

enum Vehicle: String {
    case own = "own"
    case transporter = "transporter"
}
