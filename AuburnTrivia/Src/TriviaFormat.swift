//
//  TriviaFormat.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/18/22.
//

import Foundation

struct TriviaFormat: Decodable {
    // trivia api for storing results, must use for api call to work
    var results: [Outcome]
    struct Outcome: Decodable, Identifiable {
        var id: UUID {
            UUID()
        }
        // trivia api vars, must use for api call to work
        var correctAnswer: String
        var incorrectAnswers: [String]
        var category: String
        var type: String
        var question: String
        
        // makes json data presentable
        var questionFormat: AttributedString {
            do {
                return try AttributedString(markdown: question)
            } catch {
                    print("\(error)")
                return ""
            }
        }

        var allAnswers: [AnswerKey] {
            do {
                let rightAnswer = [AnswerKey(content: try AttributedString(markdown: correctAnswer), answerChoice: true)]
                let wrongAnswers = try incorrectAnswers.map {
                    answer in AnswerKey(content: try AttributedString(markdown: answer), answerChoice: false)
                }
                let totalAnswer = rightAnswer + wrongAnswers
                // Randomize right answer index
                return totalAnswer.shuffled()
            } catch {
                    print("\(error)")
                return []
            }
        }
    }
}
