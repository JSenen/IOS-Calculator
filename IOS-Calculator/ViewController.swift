//
//  ViewController.swift
//  IOS-Calculator
//
//  Created by JSenen on 7/2/23.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -Outlets
    
    @IBOutlet weak var resultLabel: UILabel! //Result label
    
    //Numbers
    
    @IBOutlet weak var number0: UIButton!
    @IBOutlet weak var number1: UIButton!
    @IBOutlet weak var number2: UIButton!
    @IBOutlet weak var number3: UIButton!
    @IBOutlet weak var number4: UIButton!
    @IBOutlet weak var number5: UIButton!
    @IBOutlet weak var number6: UIButton!
    @IBOutlet weak var number7: UIButton!
    @IBOutlet weak var number8: UIButton!
    @IBOutlet weak var number9: UIButton!
    @IBOutlet weak var numberDecimal: UIButton!
    
    //Operator
    
    @IBOutlet weak var operatorAC: UIButton!
    @IBOutlet weak var operatorPlusMinus: UIButton!
    @IBOutlet weak var operatorPercentage: UIButton!
    @IBOutlet weak var opertorDivide: UIButton!
    @IBOutlet weak var operatorMultiply: UIButton!
    @IBOutlet weak var operatorMinus: UIButton!
    @IBOutlet weak var operatorPlus: UIButton!
    @IBOutlet weak var operatorResult: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    //MARK: -Button Actions
    
    @IBAction func operatonACAction(_ sender: Any) {
        
    }
    @IBAction func operatorPlusMinusAction(_ sender: Any) {
        
    }
    @IBAction func operatorPercentageAction(_ sender: Any) {
        
    }
    @IBAction func opertorDivideAction(_ sender: Any) {
        
    }
    @IBAction func operatorMultiplyAction(_ sender: Any) {
        
    }
    @IBAction func operatorMinusAction(_ sender: Any) {
        
    }
    @IBAction func operatorPlusAction(_ sender: Any) {
        
    }
    @IBAction func operatorResultAction(_ sender: Any) {
        
    }
    
    @IBAction func numberDecimalAction(_ sender: Any) {
    }
    
    //Acciones para los botones del 0 al 9
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
        
    }
    
}
