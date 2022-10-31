//
//  LaunchGameButton.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct LaunchGameButton: View {
    var title : String
    //Set Auburn Orange Color
    var buttonColor : Color = Color("AccentColor")
    var body: some View {
        Text(title)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(buttonColor)
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct LaunchGameButton_Previews: PreviewProvider {
    static var previews: some View {
        LaunchGameButton(title: "Next Question")
    }
}
