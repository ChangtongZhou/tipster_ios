//
//  ViewController.swift
//  Tipster
//
//  Created by Changtong Zhou on 7/10/16.
//  Copyright © 2016 Changtong Zhou. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    

    @IBOutlet var billAmount: UITextField!
    @IBOutlet var percent1Label: UILabel!
    @IBOutlet var percent2Label: UILabel!
    @IBOutlet var percent3Label: UILabel!
    @IBOutlet var tip1Label: UILabel!
    @IBOutlet var tip2Label: UILabel!
    @IBOutlet var tip3Label: UILabel!
    @IBOutlet var total1: UILabel!
    @IBOutlet var total2: UILabel!
    @IBOutlet var total3: UILabel!
    
    @IBOutlet var groupSizeLabel: UILabel!
    
    @IBOutlet var tipSlider: UISlider!
    @IBOutlet var sizeSlider: UISlider!
    
    
    var theBill: Float = 0
    var bills: Double = 0
    var decimal: Double = 0
    var typing: Bool = false
    
    @IBAction func buttonPressed(sender: UIButton) {
    
        let digit = sender.currentTitle!
        print("test if it is digit", digit)
        if digit == "C"{
            billAmount.text = "0"
        }
        else if typing && digit != "." || (digit == "." && billAmount.text!.rangeOfString(".") == nil){
            if billAmount.text != "0"
            {
                billAmount.text = billAmount.text! + digit
            }
            else
            {
                billAmount.text = digit
            }
        
        }
        else{
            if digit == "."{
                billAmount.text = "0" + digit
            }
            else{
                billAmount.text = digit
            }
            typing = true
        }
        
         theBill = Float(billAmount.text!)!
        
        print("This is double version of bill: ", theBill)
    }
    
    
    var tip1Amount: Float = 0
    var total1Amount: Float = 0
    var tip2Amount: Float = 0
    var total2Amount: Float = 0
    var tip3Amount: Float = 0
    var total3Amount: Float = 0


    
    @IBAction func sliderValueChanged(sender: UISlider) {
        let tip1Percent = Int(sender.value)
        print("ppppppppppp", tip1Percent)
        percent1Label.text = String(stringInterpolationSegment: tip1Percent) + " %"
        
        let tip2Percent = Int(tip1Percent + 5)
        percent2Label.text = String(stringInterpolationSegment: tip2Percent) + " %"
        
        let tip3Percent = Int(tip2Percent + 5)
        percent3Label.text = String(stringInterpolationSegment: tip3Percent) + " %"
        
        tip1Amount = Float(tip1Percent) * theBill / 100
        total1Amount = theBill + tip1Amount
        
        tip2Amount = Float(tip2Percent) * theBill / 100
        total2Amount = theBill + tip2Amount
        
        tip3Amount = Float(tip3Percent) * theBill / 100
        total3Amount = theBill + tip3Amount
        
        tip1Label.text = String(format: "%.2f", tip1Amount)
        
        total1.text = String(format: "%.2f", total1Amount)
        
        
        tip2Label.text = String(format: "%.2f", tip2Amount)
        total2.text = String(format: "%.2f", total2Amount)
        
        
        tip3Label.text = String(format: "%.2f", tip3Amount)
        total3.text = String(format: "%.2f", total3Amount)
        
        
        print("This is tipAmount: ", tip1Label.text)
    }
    
    @IBAction func groupSizeChanged(sender: UISlider) {
        
        let groupsize = Int(sender.value)
        
        print("ooooooooooooo", String(groupsize))
        
        
        groupSizeLabel.text = "Group Size: " + String(groupsize)
        print(tip1Amount, tip2Amount, tip3Amount)
        print(total1Amount, total2Amount, total3Amount)
        tip1Label.text = String(format: "%.2f", (tip1Amount / Float(groupsize)))
        
        total1.text = String(format: "%.2f", (total1Amount / Float(groupsize)))
        
        
        tip2Label.text = String(format: "%.2f", (tip2Amount / Float(groupsize)))
        total2.text = String(format: "%.2f", (total2Amount / Float(groupsize)))
        
        
        tip3Label.text = String(format: "%.2f", (tip3Amount / Float(groupsize)))
        total3.text = String(format: "%.2f", (total3Amount / Float(groupsize)))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billAmount.attributedPlaceholder = NSAttributedString(string: "Bill Amount", attributes: [NSForegroundColorAttributeName: UIColor.whiteColor()])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

