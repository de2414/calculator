//
//  ViewController.swift
//  CALayerDemo
//
//  Created by Frei on 2018/8/30.
//  Copyright © 2018年 Frei. All rights reserved.
//

import UIKit

var numberOnScreen:Double = 0
var previousNumber:Double = 0
var performingMath:Bool = false
var operation:OperationType = .none


enum OperationType {
    case add
    case subtract
    case multiply
    case divide
    case none
}


class ViewController: UIViewController {
    
    //MARK:The tag should be 1 more than the actual numerical value.
    //     For example, the #0 button should have a tag value of 1
    
    @IBAction func numbers(_ sender: UIButton) {
        let digit = sender.tag-1
        
        if lbshow.text != nil {
            
                if lbshow.text == "0"||lbshow.text == "+"||lbshow.text == "-"||lbshow.text == "x"||lbshow.text == "/"{
                    lbshow.text="\(digit)"
                    
                }else{
                    lbshow.text=lbshow.text!+"\(digit)"}
                
            
            
        }
        numberOnScreen = Double(lbshow.text!) ?? 0
        
    }
    
    
    
    @IBAction func clear(_ sender: UIButton) {
        lbshow.text="0"
        numberOnScreen=0
        previousNumber=0
        operation = .none
        performingMath=false
        
    }
    
    @IBAction func percent(_ sender: UIButton) {
        //lbshow.text="%"
        performingMath=true
        previousNumber=numberOnScreen
        numberOnScreen=previousNumber/100
        makeOKNumberString(from: numberOnScreen)
    }
    
    @IBAction func negative(_ sender: UIButton) {
        //lbshow.text="+/-"
        performingMath=true
        previousNumber=numberOnScreen
        numberOnScreen = -numberOnScreen
        makeOKNumberString(from: numberOnScreen)
        
    }
    
    
    @IBAction func add(_ sender: UIButton) {
        lbshow.text="+"
        operation = .add
        performingMath=true
        previousNumber=numberOnScreen
    }
    
    @IBAction func subtract(_ sender: UIButton) {
        lbshow.text="-"
        operation = .subtract
        performingMath=true
        previousNumber=numberOnScreen
        
    }
    
    @IBAction func multiply(_ sender: UIButton) {
        lbshow.text="x"
        operation = .multiply
        performingMath=true
        previousNumber=numberOnScreen
    }
    
    @IBAction func divide(_ sender: UIButton) {
        lbshow.text="/"
        operation = .divide
        performingMath=true
        previousNumber=numberOnScreen
    }
    

    @IBAction func giveMeAnswer(_ sender: UIButton) {
        if performingMath == true{
            switch operation{
            case .add:
                numberOnScreen=previousNumber+numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .subtract:
                numberOnScreen=previousNumber-numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .multiply:
                numberOnScreen=previousNumber*numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .divide:
                numberOnScreen=previousNumber/numberOnScreen
                makeOKNumberString(from: numberOnScreen)
            case .none:
                lbshow.text="0"
                
            }
            performingMath=false
            
        }
    }
    
    func makeOKNumberString(from number:Double) {
        var okText:String
        /*
        if floor(number) == number{
            lbshow.text="\(Int(number))"
        }else{
            lbshow.text="\(number)"
        }
 */
        if floor(number) == number {
            okText="\(Int(number))"
        }else{
            okText="\(number)"
        }
        if okText.count>=10 {
            okText=String(okText.prefix(10))
        }
        lbshow.text=okText
    }
    
    
    @IBOutlet weak var lbshow: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn9: UIButton!
    
    @IBOutlet weak var btnAC: UIButton!
    @IBOutlet weak var btnZhengFu: UIButton!
    @IBOutlet weak var btnPercent: UIButton!
    @IBOutlet weak var btnDivision: UIButton!
    @IBOutlet weak var btnMultiply: UIButton!
    @IBOutlet weak var btnMinus: UIButton!
    @IBOutlet weak var btnPlus: UIButton!
    @IBOutlet weak var btnEqual: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

