//
//  BevelText.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 03/10/2022.
//

import SwiftUI

struct BevelText: View {
    
    let text: String
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.element)
                        .northWestShadow(radius: 3, offset: 1)
                    Capsule()
                        .inset(by: 3)
                        .fill(Color.element)
                        .southEastShadow(radius: 1, offset: 1)
                }
                
            )
    }
}
