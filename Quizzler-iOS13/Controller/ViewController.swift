//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var choiceOneButton: UIButton!
    @IBOutlet weak var choiceTwoButton: UIButton!
    @IBOutlet weak var choiceThreeButton: UIButton!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle
        guard let userAnswer = userAnswer else { return }
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        choiceOneButton.setTitle(quizBrain.getAnswerText(choices: "answerOne"), for: .normal)
        choiceTwoButton.setTitle(quizBrain.getAnswerText(choices: "answerTwo"), for: .normal)
        choiceThreeButton.setTitle(quizBrain.getAnswerText(choices: "answerThree"), for: .normal)
        progressView.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        choiceOneButton.backgroundColor = UIColor.clear
        choiceTwoButton.backgroundColor = UIColor.clear
        choiceThreeButton.backgroundColor = UIColor.clear
    }
    
    
}

