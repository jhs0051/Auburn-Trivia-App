//
//  TriviaQuestionProgression.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct TriviaQuestionProgression: View {
    var gameProgress: CGFloat
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(maxWidth: .infinity)
                .frame(height: 5)
                .foregroundColor(Color(hue: 0.632, saturation: 1.0, brightness: 1.0, opacity: 0.327))
                .cornerRadius(20)
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .frame(width: gameProgress, height: 5)
                .foregroundColor(Color("AccentColor"))
                .cornerRadius(20)
                .animation(.spring())
        }
    }
}

struct TriviaQuestionProgression_Previews: PreviewProvider {
    static var previews: some View {
        TriviaQuestionProgression(gameProgress: 1)
    }
}

