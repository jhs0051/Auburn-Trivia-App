//
//  TriviaQuestionView.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct TriviaQuestionView: View {
    @EnvironmentObject var triviaDriver: TriviaDriver
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Aubie's Trivia Game")
                    .AuburnTextTitle()
                Spacer()
                Text("\(triviaDriver.i + 1) of \(triviaDriver.len)")
                    .foregroundColor(Color("AccentColor"))
                    .fontWeight(.heavy)
            }
            TriviaQuestionProgression(gameProgress: triviaDriver.gameProgress)
            VStack(alignment: .leading, spacing: 20) {
                Text(triviaDriver.questions)
                    .font(.system(size: 20))
                    .bold()
                    .foregroundColor(.white)
                ForEach(triviaDriver.triviaChoices, id: \.id) {
                    answer in Questions(rightAnswer: answer)
                        .environmentObject(triviaDriver)
                }
            }
            Button {
                triviaDriver.nextQuestionView()
                playSound(key: "Next-question")
            } label: {
                LaunchGameButton(title: "Next Question", buttonColor: triviaDriver.answerSelected ? Color("AccentColor") : Color(hue: 1.0, saturation: 0.0, brightness: 0.564, opacity: 0.327))
            }
                    .disabled(!triviaDriver.answerSelected)
            Spacer()
            Text("Current Score: \(triviaDriver.userScore)")
                .AuburnTextTitle()
        }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(red: 0.000, green: 0.200, blue: 0.400))
            .navigationBarHidden(true)
        }
    }

struct TriviaQuestionView_Previews: PreviewProvider {
    static var previews: some View {
        TriviaQuestionView()
            .environmentObject(TriviaDriver())
    }
}
