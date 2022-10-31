//
//  Trivia Answer.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/17/22.
//

import Foundation

struct AnswerKey: Identifiable {
    var id = UUID()
    var content: AttributedString
    var answerChoice: Bool
}
