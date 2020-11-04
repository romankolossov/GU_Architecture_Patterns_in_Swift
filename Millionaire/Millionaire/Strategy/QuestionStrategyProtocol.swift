//
//  QuestionStrategyProtocol.swift
//  Millionaire
//
//  Created by Роман Колосов on 04.11.2020.
//

import Foundation
//questinable
protocol StrategyQuestinable {
    func generateQuestions() -> [Question]
}
