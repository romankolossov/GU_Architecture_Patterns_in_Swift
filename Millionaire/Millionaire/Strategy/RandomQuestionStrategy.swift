//
//  RandomQuestionStrategy.swift
//  Millionaire
//
//  Created by Роман Колосов on 04.11.2020.
//

import Foundation

class RandomQuestionStrategy: QuestinableStrategy {
    func generateQuestions() -> [Question] {
        let questionData = QuestionData()
        let questions = questionData.getQuestions()
        
        return questions.shuffled()
    }
}
