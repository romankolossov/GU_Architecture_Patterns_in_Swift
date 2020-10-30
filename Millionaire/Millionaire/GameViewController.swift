//
//  GameViewController.swift
//  Millionaire
//
//  Created by Роман Колосов on 28.10.2020.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var questionTextView: UITextView!
    
    @IBOutlet weak var answerAButton: UIButton!
    @IBOutlet weak var answerBButton: UIButton!
    @IBOutlet weak var answerCButton: UIButton!
    @IBOutlet weak var answerDButton: UIButton!
    
    var questions: [Question] = []
    var questionNumber: Int = 1
    let questionData = QuestionData()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        questions = questionData.getQuestions()
        
        askQuestion(withNumber: questionNumber)
        
        // MARK: - Targets
        answerAButton.addTarget(self, action: #selector(answerAButtonAction), for: .touchUpInside)
        answerBButton.addTarget(self, action: #selector(answerBButtonAction), for: .touchUpInside)
        answerCButton.addTarget(self, action: #selector(answerCButtonAction), for: .touchUpInside)
        answerDButton.addTarget(self, action: #selector(answerDButtonAction), for: .touchUpInside)
    }
    
    // MARK: - Major methods
    
    func askQuestion(withNumber question: Int) {
        guard (question >= 1) && (question <= 10) else {
            print("Question number \(question) in \(#function) is out of range")
            return
        }

        var titles: [String] = [
        questions[question - 1].rightAnswer,
        questions[question - 1].choiceA,
        questions[question - 1].choiceB,
        questions[question - 1].choiceC ]
        
        questionTextView.text = questions[question - 1].question
        
        titles.shuffle()
        answerAButton.setTitle(titles[0], for: .normal)
        answerBButton.setTitle(titles[1], for: .normal)
        answerCButton.setTitle(titles[2], for: .normal)
        answerDButton.setTitle(titles[3], for: .normal)
    }
    
    func checkRightAnswer(for question: Int, whenPressed button: UIButton) {
        guard (question >= 1) && (question <= 10) else {
            print("Question number \(question) in \(#function) is out of range")
            return
        }
        
        if questions[question-1].rightAnswer == button.titleLabel?.text {
            button.titleLabel?.backgroundColor = .green
        } else {
            button.titleLabel?.backgroundColor = .red
            return
        }
    }
    
    // MARK: - Actions
    
    @objc private func answerAButtonAction()  {
        checkRightAnswer(for: questionNumber, whenPressed: answerAButton)
    }
    
    @objc private func answerBButtonAction()  {
        checkRightAnswer(for: questionNumber, whenPressed: answerBButton)
    }
    
    @objc private func answerCButtonAction()  {
        checkRightAnswer(for: questionNumber, whenPressed: answerCButton)
    }
    
    @objc private func answerDButtonAction()  {
        checkRightAnswer(for: questionNumber, whenPressed: answerDButton)
    }
    
}

