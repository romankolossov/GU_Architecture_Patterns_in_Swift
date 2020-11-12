//
//  GameSessionsCaretaker.swift
//  Millionaire
//
//  Created by Роман Колосов on 01.11.2020.
//

import Foundation

class GameSessionCaretaker {
    
    // Some properties
    private let encoder = JSONEncoder()
    private let decoder = JSONDecoder()
    private let key = "key"
    
    // MARK: - Major methods
    
    func saveGameSessions(gameSessions: [GameSession]) {
        do {
            let data = try encoder.encode(gameSessions)
            UserDefaults.standard.setValue(data, forKey: key)
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func loadGameSessions() -> [GameSession]? {
        guard let data = UserDefaults.standard.data(forKey: key) else {
            return nil
        }
        
        do {
            return try decoder.decode([GameSession].self, from: data)
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }
}
