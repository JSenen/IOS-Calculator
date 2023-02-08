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
    @IBOutlet weak var operatorDivide: UIButton!
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
    private let kTotal = "total"

    
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
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        return formatter
        
    }()
    
    private let auxTotalFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.groupingSeparator = ""
        formatter.decimalSeparator = ""
        formatter.maximumIntegerDigits = 100
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 100
        formatter.numberStyle = .decimal
        return formatter
        
    }()
    
    //Formato de valores por pantalla por defecto
    private let printFormatter: NumberFormatter = {
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
    
    //Formato de valores por pantalla en formato cientifico
    private let printScientificFormatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .scientific
        formatter.maximumFractionDigits = 3
        formatter.exponentSymbol = "e"
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
        
        total = UserDefaults.standard.double(forKey: kTotal)
        
        result()
        
    }
    
    //MARK: -Button Actions
    
    @IBAction func operatonACAction(_ sender: UIButton) {
        
        clear()
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPlusMinusAction(_ sender: UIButton) {
        temp = temp * (-1)
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPercentageAction(_ sender: UIButton) {
        
        if operation != .percentage {
            result()
        }
        operating = true
        operation = .percentage
        result()
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func opertorDivideAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .divide
        sender.selectOperation(true)
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorMultiplyAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .multiply
        sender.selectOperation(true)
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorMinusAction(_ sender: UIButton) {
        if operation != .none {
            result()
        }
        operating = true
        operation = .minus
        sender.selectOperation(true)
        
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    @IBAction func operatorPlusAction(_ sender: UIButton) {
        
        if operation != .none {
            result()
        }
        
        operating = true
        operation = .plus
        sender.selectOperation(true)
        
        
        //Efecto brillo en boton al pulsar
        sender.shine()
    }
    @IBAction func operatorResultAction(_ sender: UIButton) {
        result()
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    
    @IBAction func numberDecimalAction(_ sender: UIButton) {
        
        let currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        resultLabel.text = resultLabel.text! + kDecimalSeparator
        decimal = true
        
        selectVisualOperation()
        //Efecto brillo en boton al pulsar
        sender.shine()
    }
    
    //Acciones para los botones del 0 al 9
    @IBAction func numberAction(_ sender: UIButton) {
        print(sender.tag) //Muestra en consola el tag
        
        operatorAC.setTitle("C", for: .normal)
        var currentTemp = auxTotalFormatter.string(from: NSNumber(value: temp))!
        if !operating && currentTemp.count >= kMaxLenght {
            return
        }
        
        currentTemp = auxFormatter.string(from: NSNumber(value: temp))!
        
        //Si se selecciona una operación
        
        if operating {
            total = total == 0 ? temp : total
            resultLabel.text = ""
            currentTemp = ""
            operating = false
            
        }
        
        //Si estamos con operaciones decimales
        
        if decimal {
            currentTemp = "\(currentTemp)\(kDecimalSeparator)"
            decimal = false
        }
        
        let number = sender.tag
        temp = Double(currentTemp + String(number))!
        resultLabel.text = printFormatter.string(from: NSNumber(value: temp))
        
        selectVisualOperation()
        //Efecto brillo en boton al pulsar
        sender.shine()
        
    }
    
    //Funcion limpiar los valores
    private func clear(){
        operation = .none
        operatorAC.setTitle("AC", for: .normal)
        if temp != 0  {
            temp = 0
            resultLabel.text = "0"
        } else {
            total = 0
            result()
        }
    }
    
    //Funcion obtiene resultado final
    
    private func result(){
        
        switch operation {
            
        case .none:
            break
        case .divide:
            total = total / temp
            break
        case .multiply:
            total = total * temp
            break
        case .minus:
            total = total - temp
            break
        case .plus:
            total = total + temp
            break
        case .percentage:
            temp = temp / 100
            total = temp
            break
        }
        
        //Formateo en pantalla
        if let currentTotal = auxTotalFormatter.string(from: NSNumber(value: total)), currentTotal.count  > kMaxLenght{
            resultLabel.text = printScientificFormatter.string(from: NSNumber(value: total))
        } else {
            resultLabel.text = printFormatter.string(from: NSNumber(value: total))
        }
        
        operation = .none
        selectVisualOperation()
        UserDefaults.standard.set(total, forKey: kTotal)
    }
    //Mostrar de forma visual la operacion seleccionada
    private func selectVisualOperation(){
        if !operating {
            operatorPlus.selectOperation(false)
            operatorMinus.selectOperation(false)
            operatorMultiply.selectOperation(false)
            operatorDivide.selectOperation(false)
            
            
        } else {
            switch operation {
                
            case .none, .percentage:operatorPlus.selectOperation(false)
                operatorMinus.selectOperation(false)
                operatorMultiply.selectOperation(false)
                operatorDivide.selectOperation(false)
                break
            case .divide:
                operatorPlus.selectOperation(false)
                operatorMinus.selectOperation(false)
                operatorMultiply.selectOperation(false)
                operatorDivide.selectOperation(true)
                break
            case .multiply:
                operatorPlus.selectOperation(false)
                operatorMinus.selectOperation(false)
                operatorMultiply.selectOperation(true)
                operatorDivide.selectOperation(false)
                break
            case .minus:
                operatorPlus.selectOperation(false)
                operatorMinus.selectOperation(true)
                operatorMultiply.selectOperation(false)
                operatorDivide.selectOperation(false)
                break
            case .plus:
                operatorPlus.selectOperation(true)
                operatorMinus.selectOperation(false)
                operatorMultiply.selectOperation(false)
                operatorDivide.selectOperation(false)
                break
           
            }
        
            
        }
        
    }
    
}
