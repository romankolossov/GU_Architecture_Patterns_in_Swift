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
    
    // Some propertioes
    var questions: [Question] = []
    var questionNumber: Int = 1
    var numberOfQuestions: Int = 0
    let questionData = QuestionData()
    var score: Int = 0
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questions = questionData.getQuestions()
        numberOfQuestions = questions.count
        
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
        
        guard questions[question-1].rightAnswer == button.titleLabel?.text else {
            button.titleLabel?.backgroundColor = .red
            
            guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
                self?.dismiss(animated: true, completion: nil)
                self?.present(mainVC, animated: true, completion: nil)
            }
            return
        }
        
        button.titleLabel?.backgroundColor = .green
        score += 10
        
        guard (questionNumber % numberOfQuestions) != 0 else {
            guard let mainVC = storyboard?.instantiateViewController(withIdentifier: "MainViewController") as? MainViewController else { fatalError() }
            #if DEBUG
            print("last question number: \(questionNumber) of \(numberOfQuestions)")
            #endif
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
                self?.dismiss(animated: true, completion: nil)
                self?.present(mainVC, animated: true, completion: nil)
            }
            return
        }
        
        questionNumber += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
            button.titleLabel?.backgroundColor = .none
            self?.askQuestion(withNumber: self?.questionNumber ?? 1)
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

