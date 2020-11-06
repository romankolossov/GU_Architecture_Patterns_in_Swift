//
//  Question.swift
//  Millionaire
//
//  Created by Роман Колосов on 29.10.2020.
//

import Foundation

struct Question: Codable {
    
    let question: String
    let rightAnswer: String
    let choiceA: String
    let choiceB: String
    let choiceC: String
}
