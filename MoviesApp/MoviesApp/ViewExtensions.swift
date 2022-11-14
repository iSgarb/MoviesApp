//
//  ViewExtensions.swift
//  MoviesApp
//
//  Created by Sebastián García Burgos on 14/11/22.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func moviesShadow(_ radius: CGFloat = 3) -> some View {
        self.shadow(color: .black.opacity(1), radius: radius)
    }
}

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
