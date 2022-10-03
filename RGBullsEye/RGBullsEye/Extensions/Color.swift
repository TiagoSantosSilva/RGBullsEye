//
//  Color.swift
//  RGBullsEye
//
//  Created by Tiago Silva on 29/09/2022.
//

import Foundation
import SwiftUI

extension Color {
    
    // MARK: Colors
    
    static let element = Color("Element")
    static let highlight = Color("Highlight")
    static let shadow = Color("Shadow")
    
    /// Create a Color view from an RGB object.
    ///   - parameters:
    ///     - rgb: The RGB object.
    init(rgbStruct rgb: RGB) {
        self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
}
