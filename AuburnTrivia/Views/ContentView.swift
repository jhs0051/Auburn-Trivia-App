//
//  ContentView.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var triviaDriver = TriviaDriver()
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                VStack(spacing: 10) {
                    Text("Aubie's Trivia Challenge:")
                        .AuburnTextTitle()
                    Text("See how well your sports knowledge compares to Aubie's")
                        .multilineTextAlignment(.center)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color("AccentColor"))
                }
                NavigationLink {
                    TriviaEndScreenView().environmentObject(triviaDriver)
                } label : {
                    LaunchGameButton(title: "Play now!")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            // Set Auburn Navy Color
        .background(Color(red: 0.000, green: 0.200, blue: 0.400))
        }
        // Work on iPads
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
