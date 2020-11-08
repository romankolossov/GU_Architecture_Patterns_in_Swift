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
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreByDelegateLabel.text = "Your last result is: \(GameSingleton.shared.gameSessions.last?.score.description ?? "0")"
        
        scoreByClosureLabel.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "to_gameVC":
            guard let destination =  segue.destination as? GameViewController else { return }
            
            destination.gameVCDelegate = self
            
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
    func didEndGame(with result: Int) {
        let gameSession = GameSession(date: Date(), score: result)
        
        GameSingleton.shared.addGameSession(gameSession: gameSession)
        scoreByDelegateLabel.text = "Your last result is: \(result) (by delegate)"
    }
}
