//
//  NormalQuestionStrategy.swift
//  Millionaire
//
//  Created by Роман Колосов on 04.11.2020.
//

import Foundation

class NormalQuestionStrategy: StrategyQuestinable {
    func generateQuestions() -> [Question] {
        let questionData = QuestionData()
        
        return questionData.getQuestions()
    }
}
