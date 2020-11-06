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
        
        lookConfigure()
        
        // MARK: - Targets
        resumeButton.addTarget(self, action: #selector(resumeButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Main Methods
    
    private func lookConfigure() {
        
        questionTextView.backgroundColor = .quaternarySystemFill
        rightAnswerTextField.backgroundColor = .quaternarySystemFill
        answerATextField.backgroundColor = .quaternarySystemFill
        answerBTextField.backgroundColor = .quaternarySystemFill
        answerCTextField.backgroundColor = .quaternarySystemFill
    }
    
    // MARK: - Actions
    
    @objc private func resumeButtonAction()  {
        guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
        
        let customQuestion = Question(question: questionTextView.text,
                                      rightAnswer: rightAnswerTextField.text ?? "",
                                      choiceA: answerATextField.text ?? "",
                                      choiceB: answerBTextField.text ?? "",
                                      choiceC: answerCTextField.text ?? "")
        
        CustomQuestionSingleton.shared.addCustomQuestion(question: customQuestion)
        
        dismiss(animated: true, completion: nil)
        present(mainVC, animated: true, completion: nil)
    }

}
