//
//  TriviaDriver.swift
//  Su22TriviaAppFinalProject
//
//  Created by Jon Houston Seibert on 7/18/22.
//

import Foundation
import SwiftUI

extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
}


class TriviaDriver: ObservableObject {
    private(set) var trivia: [TriviaFormat.Outcome] = []
    private var idiom : UIUserInterfaceIdiom { UIDevice.current.userInterfaceIdiom }
    @Published private(set) var len = 0
    @Published private(set) var i = 0
    @Published private(set) var userScore = 0
    @Published private(set) var gameProgress: CGFloat = 0.00
    @Published private(set) var end = false
    @Published private(set) var answerSelected = false
    @Published private(set) var questions: AttributedString = ""
    @Published private(set) var triviaChoices: [AnswerKey] = []
    
    init() {
        Task.init {
            await getTriviaQuestions()
        }
    }
    
    func getTriviaQuestions() async {
        guard let url = URL(string: "https://opentdb.com/api.php?amount=10&category=21&type=multiple")
        else {
            fatalError("Invalid link")
        }
        let request = URLRequest(url: url)
        do {
            let (question, fetched) = try await URLSession.shared.data(for: request)
            guard(fetched as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Can't fetch data") }
            
            let decoder = JSONDecoder()
            // converts json data to correct form
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodedQuestions = try decoder.decode(TriviaFormat.self, from: question)
            
            DispatchQueue.main.async {
                // Show user's score
                self.trivia = decodedQuestions.results
                self.len = self.trivia.count
                self.triviaQuestions()

                // In case user wants to replay
                self.i = 0
                self.userScore = 0
                self.gameProgress = 1
                self.end = false
            }
        } catch {
               print("\(error)")
            }
    }
    
    func nextQuestionView() {
        if (i + 1) < len {
            i += 1
            // Populates new question until end
            triviaQuestions()
        } else {
            end = true
        }
    }
    
    func triviaQuestions() {
        answerSelected = false
        
        // Scale game progess bar as game progresses
        gameProgress = CGFloat(Float(i) / Float(len)) * UIScreen.screenWidth
        
        // Continue asking questions until question bank runs out
        if i < len {
            let currentTriviaQuestion = trivia[i]
            questions = currentTriviaQuestion.questionFormat
            triviaChoices = currentTriviaQuestion.allAnswers
        }
    }
    
    func userAnswer(answer : AnswerKey) {
        answerSelected = true
        if answer.answerChoice {
            playSound(key: "Correct-answer")
            userScore += 1
        }
        else {
            playSound(key: "Wrong-answer")
        }
    }
}
