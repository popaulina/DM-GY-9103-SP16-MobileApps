//
//  ViewController.swift
//  Quiz
//
//  Created by Paulina Levit on 2/2/16.
//  Copyright © 2016 Paulina Levit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = ["From what is cognac made?",
                                "What is 7+7?",
                                "What is the capital of Vermont?"]
    
    let answers: [String] = ["Grapes", "14", "Montpelier"]
    
    var currentQuestionsIndex: Int = 0
    
    @IBAction func showNextQuestion(sender: AnyObject) {
        ++currentQuestionsIndex
        if currentQuestionsIndex == questions.count {
            currentQuestionsIndex = 0
        }
        let question: String = questions[currentQuestionsIndex]
        questionLabel.text = question
        answerLabel.text = "???"
    }
    
    
    
    @IBAction func showAnswer(sender: AnyObject) {
        let answer: String = answers[currentQuestionsIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionsIndex]
    }
}

