//
//  ViewController.swift
//  Quiz
//
//  Created by Seab on 12/29/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    let questions: [String] = [
        "What is 7 + 7?",
        "What is the capital of Vermont?",
        "What is cognac made from?",
        "What is the capital of Taiwan?"
    ]
    
    let answers: [String] = [
        "14",
        "Montepelier",
        "Grapes",
        "Taipei"
    ]
    
    var currentQuestionIndex: Int = 0
    
    @IBAction func showNextQuestion(_ sender: UIButton) {
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        questionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        questionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's inital alpha
        questionLabel.alpha = 0
    }
    
    // animations method
    func animateLabelTransitions() {
        
        // animate the alpha
        UIView.animate(withDuration: 0.5, animations: {
            self.questionLabel.alpha = 1
        })
    }
    
    
}


























