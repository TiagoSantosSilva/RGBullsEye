//
//  ColorSlider.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct ColorSlider: View {
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text(Constants.initialValue)
            Slider(value: $value)
                .accentColor(trackColor)
                .padding(.horizontal)
            Text(Constants.finalValue)
        }
        .font(.subheadline)
        .padding(.horizontal)
    }
}

private extension ColorSlider {
    enum Constants {
        static let initialValue: String = "0"
        static let finalValue: String = "255"
    }
}
