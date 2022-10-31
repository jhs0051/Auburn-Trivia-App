//
//  TriviaGameView.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct TriviaEndScreenView: View {
    @EnvironmentObject var triviaDriver: TriviaDriver
    var body: some View {
        if triviaDriver.end{
            VStack(spacing: 10) {
                Text("Game Over!")
                    .AuburnTextTitle()
                    .padding()
                Text("Your final score is \(triviaDriver.userScore) out of \(triviaDriver.len)")
                if triviaDriver.userScore < 5 {
                    Text("Oh no, you forgot to study!")
                }
                else if triviaDriver.userScore >= 5 && triviaDriver.userScore < 8 {
                    Text("Awesome, let's go Big Blue!")
                }
                else if triviaDriver.userScore >= 8 {
                    Text("You're a true Auburn Tiger!")
                }
                Button {
                    Task.init {
                        await triviaDriver.getTriviaQuestions()
                        playSound(key: "Play")
                    }
                } label: {
                    LaunchGameButton(title: "Play Again")
                        .padding()
                }
            }
            .foregroundColor(Color("AccentColor"))
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.000, green: 0.200, blue: 0.400))
            .navigationBarBackButtonHidden(true)
        } else {
            TriviaQuestionView().environmentObject(triviaDriver)
        }
    }
}

struct TriviaGameView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaEndScreenView()
            .environmentObject(TriviaDriver())
    }
}
