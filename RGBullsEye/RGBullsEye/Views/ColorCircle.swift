//
//  ColorCircle.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct ColorCircle: View {
    let color: RGB
    let size: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.element)
                .northWestShadow()
            Circle()
                .fill(Color(rgbStruct: color))
                .padding(20)
        }
        .frame(width: size, height: size)
    }
}
