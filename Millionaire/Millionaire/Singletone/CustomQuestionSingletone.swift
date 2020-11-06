//
//  CustomQuestionSingletone.swift
//  Millionaire
//
//  Created by Роман Колосов on 06.11.2020.
//

import Foundation

class CustomQuestionSingleton {
    
    // Singletone
    static let shared = CustomQuestionSingleton()
    
    // Some variables
    private(set) var customQuestions: [Question] {
        didSet {
            customQuestionCaretaker.saveCustomQuestions(questions: customQuestions)
        }
    }
    
    // Caretaker
    private let customQuestionCaretaker = CustomQuestionCaretaker()
    
    // Initializer
    private init() {
        customQuestions = customQuestionCaretaker.loadCustomQuestions() ?? []
    }
    
    // MARK: - Major methods
    
    func addCustomQuestion(question: Question) {
        customQuestions.append(question)
    }
    
    func clearCustomQuestions() {
        customQuestions.removeAll()
    }
}


