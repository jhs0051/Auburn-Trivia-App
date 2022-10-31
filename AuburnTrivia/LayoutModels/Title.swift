//
//  TextView.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import Foundation
import SwiftUI

// OOP func for Auburn style text
extension Text {
    func AuburnTextTitle() -> some View {
        self.font(.title)
            .fontWeight(.heavy)
            .foregroundColor(Color("AccentColor"))
    }
}
