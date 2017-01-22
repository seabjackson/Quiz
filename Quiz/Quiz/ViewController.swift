//
//  ViewController.swift
//  Quiz
//
//  Created by Seab on 12/29/16.
//  Copyright © 2016 Seab Jackson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var currentQuestionLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
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
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
        
    }
    
    @IBAction func showAnswer(_ sender: UIButton) {
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // set the label's inital alpha
        nextQuestionLabel.alpha = 0
    }
    
    // animations method
    func animateLabelTransitions() {
        
        // animate the alpha
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.currentQuestionLabel.alpha = 0
            self.nextQuestionLabel.alpha = 1
        }) { _ in
            swap(&self.currentQuestionLabel, &self.nextQuestionLabel)
        }
    }
    
    
}


























