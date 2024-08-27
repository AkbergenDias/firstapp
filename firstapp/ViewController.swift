//
//  ViewController.swift
//  firstapp
//
//  Created by Диас Акберген on 12.08.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var textfield2: UITextField!
    @IBOutlet weak var textfield: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func touchDown(_ sender: Any) {
        //Label.text = textfield.text
        let a = textfield.text!
        
        let b = textfield2.text!
        
        let sum = Int(a)! + Int(b)!
        
        Label.text = "sum = \(sum)"
        
        
        
    }
    @IBAction func Touchdown4(_ sender: Any) {
        
        let a = textfield.text!
        
        let b = textfield2.text!
        
        let multiply = Int(a)! * Int(b)!
        
        Label.text = "multiply = \(multiply)"
    }
    @IBAction func Touchdown3(_ sender: Any) {
        
        let a = textfield.text!
        
        let b = textfield2.text!
        
        let divide = Int(a)! / Int(b)!
        
        Label.text = "divide = \(divide)"
    }
    @IBAction func Touchdown2(_ sender: Any) {
        
        let a = textfield.text!
        
        let b = textfield2.text!
        
        let subtract = Int(a)! - Int(b)!
        
        Label.text = "subtract = \(subtract)"
    }
    
    
}

