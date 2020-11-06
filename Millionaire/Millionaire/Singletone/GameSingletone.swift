//
//  GameSingletone.swift
//  Millionaire
//
//  Created by Роман Колосов on 01.11.2020.
//

import Foundation

class GameSingleton {
    
    // Singletone
    static let shared = GameSingleton()
    
    // Some variables
    private(set) var gameSessions: [GameSession] {
        didSet {
            gameSessionCaretaker.saveGameSessions(gameSessions: gameSessions)
        }
    }
    
    // Caretaker
    private let gameSessionCaretaker = GameSessionCaretaker()
    
    // Initializer
    private init() {
        gameSessions = gameSessionCaretaker.loadGameSessions() ?? []
    }
    
    // MARK: - Major methods
    
    func addGameSession(gameSession: GameSession) {
        gameSessions.append(gameSession)
    }
    
    func clearGameSessions() {
        gameSessions.removeAll()
    }
}

