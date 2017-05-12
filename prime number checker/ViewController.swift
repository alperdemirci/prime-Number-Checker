//
//  ViewController.swift
//  prime number checker
//
//  Created by alper on 5/9/17.
//  Copyright © 2017 alper. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!

    @IBOutlet weak var primeNumberTextField: UITextField!
    @IBOutlet var myUIView: UIView!


    override func viewDidLoad() {
        super.viewDidLoad()
        primeNumberTextField.addTarget(self, action: #selector(ViewController.textFieldDidChange(_:)), for: UIControlEvents.editingChanged)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardUP), name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardDown), name: .UIKeyboardWillHide, object: nil)
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.touchHappen(_:)))
        view.addGestureRecognizer(tap)
        view.isUserInteractionEnabled = true
        

    }
    
    func touchHappen(_ sender: UITapGestureRecognizer) {
        self.primeNumberTextField.resignFirstResponder()
    }



    @IBAction func primeNumberCheck(_ sender: Any) {
            resultLabel.text = "Ouch my head!!! you don't have to hit me!! \n I can see that you typed, give me a sec I am thinking :-)"
        let when = DispatchTime.now() + 3 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.textFieldChanged(Any)
        }
    }

    func textFieldDidChange(_ textField: UITextField) {
        
    }
    
    @IBAction func textFieldChanged(_ sender: Any) {
        resultLabel.text = "Lets see if this number is a Prime number"
        guard primeNumberTextField.text != ""  else {
            resultLabel.text = "What are you waiting for!"
            return
        }
        let number = Int(primeNumberTextField.text!)
        guard number != nil else {
            resultLabel.text = "Only numbers, Please!!!! :-("
            return
        }
        guard let text = primeNumberTextField.text, !text.isEmpty else {
            resultLabel.text = "Please enter a number"
            return
        }
        var isPrime: String?
        var i = 2
        guard number != nil else {
            resultLabel.text = "Only numbers, Please!!!! :-("
            return
        }
        isPrime =  number! > 1 ? "Yes, \(number!) is a Prime number" : "\(number!) is not a Prime number!!"
        while i < number! {
            if number! % i == 0 {
                isPrime = "\(number!) is not a Prime number!!"
            }
            i += 1
        }
        resultLabel.text = isPrime
    }
    //keyboard adjustment
    func keyboardUP(notification: NSNotification) {
        self.view.frame.origin.x = 0
        self.view.layoutIfNeeded()
//        UIView.animate(withDuration: 3) {
            self.view.frame.origin.y = -253
//        }
    }
    
    func keyboardDown(notification: NSNotification) {
        self.view.frame.origin.x = 0
        self.view.frame.origin.y = 0
    }
}



