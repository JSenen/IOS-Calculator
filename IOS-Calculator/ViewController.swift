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
    
    //MARK: -Variables
    
    private var total:Double = 0        //Total
    private var temp:Double = 0         //Valor por pantalla
    private var operating:Bool = false  //Indica si se selecciona un operador
    private var decimal:Bool = false    //Si usamos decimales
    private var operation:OperationType = .none //Operacion actual
    
    //MARK: -Constantes
    
    private let kDecimalSeparator = Locale.current.decimalSeparator!
    private let kMaxLenght = 9
    private let kMaxValue:Double = 999999999
    private let kMinValue:Double = 0.00000001
    
    //Define tipo de operaciones soporta la calculadora
    private enum OperationType {
        case none,divide,multiply,minus,plus,percentage
    }
    
    //Formato de valores auxiliar
    private let auxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        return formatter
        
    }()
    
    //Formato de valores por pantalla por defecto
    private let kauxFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        let locale = Locale.current
        formatter.groupingSeparator = locale.groupingSeparator
        formatter.decimalSeparator = locale.decimalSeparator
        formatter.numberStyle = .decimal
        formatter.maximumIntegerDigits = 9
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 8
        return formatter
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Poner los botones redondos
        number0.round()
        number1.round()
        number2.round()
        number3.round()
        number4.round()
        number5.round()
        number6.round()
        number7.round()
        number8.round()
        number9.round()
        numberDecimal.round()
        
        numberDecimal.setTitle(kDecimalSeparator, for: .normal)
        
    }
    
    //MARK: -Button Actions
    
    @IBAction func operatonACAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPercentageAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func opertorDivideAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorMultiplyAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorMinusAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPlusAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
    }
    @IBAction func operatorResultAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        //Efecto brillo en boton al pulsar
        sender.shine()
    }
    
    //Acciones para los botones del 0 al 9
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag)
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    
}
