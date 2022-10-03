//
//  NeuButtonStyle.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct NeuButtonStyle: ButtonStyle {
    let width: CGFloat
    let height: CGFloat
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(width: width, height: height)
            .background(
                Group {
                    if configuration.isPressed {
                        Capsule()
                            .fill(Color.element)
                            .southEastShadow()
                    } else {
                        Capsule()
                            .fill(Color.element)
                            .northWestShadow()
                    }
                }
            )
            .foregroundColor(Color(.systemBlue))
            .opacity(configuration.isPressed ? 0.2 : 1)
    }
}
