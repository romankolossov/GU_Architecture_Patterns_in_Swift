//
//  CustomQuestionCaretaker.swift
//  Millionaire
//
//  Created by Роман Колосов on 06.11.2020.
//

import Foundation

class CustomQuestionCaretaker {
    
    // Some properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "questionKey"
    
    // MARK: - Major methods
    
    func saveCustomQuestions(questions: [Question]) {
        do {
            let data = try encoder.encode(questions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadCustomQuestions() -> [Question]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([Question].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}

