//
//  MainViewController.swift
//  Millionaire
//
//  Created by Роман Колосов on 31.10.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scoreByDelegateLabel: UILabel!
    @IBOutlet weak var scoreByClosureLabel: UILabel!
    @IBOutlet weak var difficultySegmentControl: UISegmentedControl!
    
    // Some properties
    private var selectedDifficulty: Difficulty {
        switch difficultySegmentControl.selectedSegmentIndex {
        case 0:
            return .normal
        case 1:
            return .random
        default:
            return .normal
        }
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let lasrResultScore = GameSingleton.shared.gameSessions.last?.score.description ?? "0"
        
        scoreByDelegateLabel.text = "Your last result is: \(lasrResultScore)"
        
        scoreByClosureLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "to_gameVC":
            guard let destination =  segue.destination as? GameViewController else { return }
            
            destination.gameVCDelegate = self
            
            destination.difficulty = selectedDifficulty
            
            destination.onGameEnd = { [weak self] result in
                self?.scoreByClosureLabel.text = "Your last result is: \(result) (by closure)"
                self?.scoreByClosureLabel.isHidden = false
            }
        default:
            break
        }
    }
}

// MARK: - GameViewControllerDelegate

extension MainViewController: GameViewControllerDelegate {
    func didEndGame(with result: Int, questionsInGame: Int) {
        let gameSession = GameSession(date: Date(), score: result, questionsInGame: questionsInGame)
        
        GameSingleton.shared.addGameSession(gameSession: gameSession)
        scoreByDelegateLabel.text = "Your last result is: \(result) (by delegate)"
    }
}
