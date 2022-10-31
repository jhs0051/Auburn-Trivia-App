//
//  Answer Choices.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import SwiftUI

struct Questions: View {
    @EnvironmentObject var triviaDriver: TriviaDriver
    var rightAnswer: AnswerKey
    // user choice
    @State private var chosen = false
    
    // Light up answer box green for correct or red for incorrect
    var colorForCorrectAnswer = Color(.displayP3, red: -0.0420, green: 1.2419, blue: 0.0)
    var colorForIncorrectAnswer = Color(.displayP3, red: 1.22486, green: -0.0420312, blue: -0.01964301)
    
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.footnote)
            Text(rightAnswer.content)
                .bold()
            if chosen {
                Spacer()
                Image(systemName: rightAnswer.answerChoice ? "checkmark" : "x.circle")
                    .foregroundColor(rightAnswer.answerChoice ? colorForCorrectAnswer : colorForIncorrectAnswer)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(triviaDriver.answerSelected ? (chosen ? Color(.black) : .gray) : Color(.black))
        .background(.white)
        .cornerRadius(10)
        .shadow(color: chosen ? (rightAnswer.answerChoice ? colorForCorrectAnswer : colorForIncorrectAnswer) : .gray, radius: 5, x: 0.5, y:0.5)
        // User answer choice
        .onTapGesture {
            if !triviaDriver.answerSelected {
                chosen = true
                triviaDriver.userAnswer(answer: rightAnswer)
            }
        }
    }
}

struct Answer_Choices_Previews: PreviewProvider {
    static var previews: some View {
        Questions(rightAnswer: AnswerKey(content : "single", answerChoice: false))
        TriviaQuestionView()
            .environmentObject(TriviaDriver())
    }
}
