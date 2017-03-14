//
//  ViewController.swift
//  calc
//
//  Created by Wankhade, Rachana on 2/25/17.
//  Copyright © 2017 Wankhade, Rachana. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let appTintColor = UIColor(red: 0.0, green: 1.0, blue: 0.8, alpha: 1.0)
    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.tintColor = appTintColor
        print("view will appear")
        self.fadeIn()
        self.fectchUserDefault()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
        self.fadeOut()
    }
    func fadeIn(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 1.0
            
        })
    }
    func fadeOut(duration: TimeInterval = 1.0) {
        UIView.animate(withDuration: 0.5, animations: {
            self.view.alpha = 0.0
            
        })
    }
    func fectchUserDefault() {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tip_percentage_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
        self.calculateTip(defaultTipIndex as AnyObject)
    }
    
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
}
