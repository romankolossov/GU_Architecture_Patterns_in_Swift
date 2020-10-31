//
//  MainViewController.swift
//  Millionaire
//
//  Created by Роман Колосов on 31.10.2020.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scoreByDelegateLable: UILabel!
    @IBOutlet weak var scoreByClosureLable: UILabel!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreByClosureLable.isHidden = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "to_gameVC":
            guard let destination =  segue.destination as? GameViewController else { return }
            
            destination.gameVCDelegate = self
            
            destination.onGameEnd = { [weak self] result in
                self?.scoreByClosureLable.text = "Your last result is: \(result) (by closure)"
                self?.scoreByClosureLable.isHidden = false
            }
        default:
            break
        }
    }
}

// MARK: - GameViewControllerDelegate

extension MainViewController: GameViewControllerDelegate {
    func didEndGame(with result: Int) {
        scoreByDelegateLable.text = "Your last result is: \(result) (by delegate)"
    }
}
