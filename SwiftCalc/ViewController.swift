//
//  ViewController.swift
//  SwiftCalc
//
//  Created by Patrick Cooke on 5/9/16.
//  Copyright © 2016 Patrick Cooke. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var myLabel  :UILabel!
    var leftSideFloat = 0 as Float
    var rightSideFloat = 0 as Float
    var currentNumberLabel = ""
    var currentNumberFloat = 0 as Float
    var operatorPressed = false
    var operatorType = ""
    var solution = 0 as Float
    
    //MARK: - Interactivity Methods
    
    @IBAction func numberButtonPressed(sender: UIButton){
        if operatorPressed{
            currentNumberLabel = currentNumberLabel + sender.titleLabel!.text!
            myLabel.text = currentNumberLabel
            print(myLabel.text!)
            rightSideFloat = Float(currentNumberLabel)!
        } else if !operatorPressed{
            currentNumberLabel = currentNumberLabel + sender.titleLabel!.text!
            myLabel.text = currentNumberLabel
            print(myLabel.text!)
            leftSideFloat = Float(currentNumberLabel)!
        }
    }
    
    @IBAction func operatorButtonPressed(sender: UIButton){
        operatorPressed = true
        operatorType = sender.titleLabel!.text!
        myLabel.text = sender.titleLabel!.text!
        currentNumberLabel = ""
        print(operatorType)
    }
    
    @IBAction func equalPressed(sender: UIButton) {
        switch operatorType {
        case "+":
            solution = leftSideFloat + rightSideFloat
        case "-":
            solution = leftSideFloat - rightSideFloat
        case "*":
            solution = leftSideFloat * rightSideFloat
        case "/":
            solution = leftSideFloat / rightSideFloat
        default:
            myLabel.text = "error"
        }
        myLabel.text = String(solution)
        print(solution)
        solution = 0
        leftSideFloat = 0
        rightSideFloat = 0
        currentNumberLabel = ""
        operatorPressed = false
        operatorType = ""
    }
    
    @IBAction func decimalPressed(sender: UIButton){
        if currentNumberLabel.containsString(".") {
            print("already has decimal")
        } else {
            currentNumberLabel = currentNumberLabel + "."
            myLabel.text = currentNumberLabel
            print(currentNumberLabel)
        }
    }
    
    @IBAction func percentButtonPressed(sender: UIButton) {
        currentNumberFloat = Float(currentNumberLabel)! / 100
        myLabel.text = String(currentNumberFloat)
        currentNumberLabel = String(currentNumberFloat)
        if operatorPressed {
            rightSideFloat = Float(currentNumberLabel)!
        } else if !operatorPressed {
            leftSideFloat = Float(currentNumberLabel)!
        }
        print(currentNumberLabel)
    }
    
    
    @IBAction func clearPressed(sender: UIButton){
        solution = 0
        leftSideFloat = 0
        rightSideFloat = 0
        currentNumberLabel = "0"
        operatorPressed = false
        operatorType = ""
        myLabel.text = ""
    }
    
    @IBAction func negButtonPressed(sender: UIButton){
        currentNumberFloat = -1 * Float(currentNumberLabel)!
        myLabel.text = String(currentNumberFloat)
        currentNumberLabel = String(currentNumberFloat)
        if operatorPressed {
            rightSideFloat = Float(currentNumberLabel)!
        } else if !operatorPressed {
            leftSideFloat = Float(currentNumberLabel)!
        }
        print(currentNumberLabel)
    }
    
    //MARK: - Life Cycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

