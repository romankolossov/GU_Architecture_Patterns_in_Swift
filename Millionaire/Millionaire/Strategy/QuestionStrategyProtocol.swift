//
//  QuestionStrategyProtocol.swift
//  Millionaire
//
//  Created by Роман Колосов on 04.11.2020.
//

import Foundation
//questinable
protocol QuestinableStrategy {
    func generateQuestions() -> [Question]
}
