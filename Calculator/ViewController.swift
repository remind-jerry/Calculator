//
//  ViewController.swift
//  Calculator
//
//  Created by Еременко Игорь on 27.01.2021.
//

import UIKit

final class ViewController: UIViewController {
    
    // MARK: - IBOutlets

    @IBOutlet private weak var result: UILabel!

    @IBOutlet private weak var buttonC: UIButton!
    @IBOutlet private weak var buttonNotUsed1: UIButton!
    @IBOutlet private weak var buttonNotUsed2: UIButton!
    @IBOutlet private weak var buttonSlash: UIButton!
    @IBOutlet private weak var button7: UIButton!
    @IBOutlet private weak var button8: UIButton!
    @IBOutlet private weak var button9: UIButton!
    @IBOutlet private weak var buttonX: UIButton!
    @IBOutlet private weak var button4: UIButton!
    @IBOutlet private weak var button5: UIButton!
    @IBOutlet private weak var button6: UIButton!
    @IBOutlet private weak var buttonMinus: UIButton!
    @IBOutlet private weak var button1: UIButton!
    @IBOutlet private weak var button2: UIButton!
    @IBOutlet private weak var button3: UIButton!
    @IBOutlet private weak var buttonPlus: UIButton!
    @IBOutlet private weak var button0: UIButton!
    @IBOutlet private weak var buttonNotUsed3: UIButton!
    @IBOutlet private weak var buttonRavno: UIButton!
    
    // MARK: - Private properties
    
    private var numberOfScreen: Double = 0
    private var firstNum: Double = 0
    private var mathSign: Bool = false
    private var operation: Int = 0

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupButtonsCorners()
    }

    // MARK: - Private methods

    private func setupButtonsCorners() {
        [buttonC, buttonNotUsed1, buttonNotUsed2, buttonSlash, button1, button2, button3, button4, button5, button6,button7, button8, button9, button0, buttonX, buttonMinus, buttonPlus, buttonRavno, buttonNotUsed3].forEach {
            $0?.layer.cornerRadius = 15
        }
    }

    // MARK: - IBActions

    @IBAction func digits(_ sender: UIButton) {
        if mathSign == true {
            result.text = String(sender.tag)
            mathSign = false
        } else {
            result.text = result.text! + String(sender.tag)
        }
        
        
        numberOfScreen = Double(result.text!)!
    }
    
    @IBAction func buttons(_ sender: UIButton) {
        if result.text != "" && sender.tag != 10 && sender.tag != 15 {
            firstNum = Double(result.text!)!
            if sender.tag == 11 { // \
                result.text = "/";
            } else if sender.tag == 12 { // x
                result.text = "x";
            } else if sender.tag == 13 { // -
                result.text = "-";
            } else if sender.tag == 14 { // +
                result.text = "+";
            }
            operation = sender.tag
            mathSign = true;
        } else if sender.tag == 15{
            if operation == 11 {
                result.text = String(firstNum / numberOfScreen)
            }
            else if operation == 12 {
                result.text = String(firstNum * numberOfScreen)
            }
            else if operation == 13 {
                result.text = String(firstNum - numberOfScreen)
            }
            else if operation == 14 {
                result.text = String(firstNum + numberOfScreen)
            }
        } else if sender.tag == 10 {
            result.text = ""
            firstNum = 0
            numberOfScreen = 0
            operation = 0
        }
    }

}

