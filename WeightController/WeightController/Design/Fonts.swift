//
//  Fonts.swift
//  WeightController
//
//  Created by Markel Juaristi on 13/12/23.
//

import Foundation
import SwiftUI

extension Font {
    static func whatTheFont(size: CGFloat) -> Font {
        return Font.custom("WhatTheFont-Regular", size: size)
    }
    
    static func identifont(size: CGFloat) -> Font {
        return Font.custom("Identifont-Regular", size: size)
    }
}
