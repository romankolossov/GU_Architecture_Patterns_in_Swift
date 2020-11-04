//
//  CustomQuestionViewController.swift
//  Millionaire
//
//  Created by Роман Колосов on 05.11.2020.
//

import UIKit

class CustomQuestionViewController: UIViewController {
    
    @IBOutlet weak var questionTextView: UITextView!
    @IBOutlet weak var rightAnswerTextField: UITextField!
    @IBOutlet weak var answerATextField: UITextField!
    @IBOutlet weak var answerBTextField: UITextField!
    @IBOutlet weak var answerCTextField: UITextField!
    @IBOutlet weak var resumeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - Targets
        resumeButton.addTarget(self, action: #selector(resumeButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Actions
    
    @objc private func resumeButtonAction()  {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
        
        dismiss(animated: true, completion: nil)
        present(mainVC, animated: true, completion: nil)
    }

}
