//
//  TipViewController.swift
//  calc
//
//  Created by Wankhade, Rachana on 2/25/17.
//  Copyright © 2017 Wankhade, Rachana. All rights reserved.
//

import UIKit

class TipViewController: UIViewController {


    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!

    let defaults = UserDefaults.standard
    var darkMode: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        NotificationCenter.default.addObserver(self, selector: #selector(self.setLastValues), name: NSNotification.Name.UIApplicationWillResignActive, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.fetchLastValues), name: NSNotification.Name.UIApplicationDidBecomeActive, object: nil)

          self.billField.placeholder = "$"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")

        self.fectchUserDefault()
        self.setAppearance()
        if (self.totalLabel.text == "$0.00")
        {
            self.fadeOut()
        } else {
            self.fadeIn()
        }
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")

        self.billField.becomeFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }

    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func fectchUserDefault() {
        let defaultTipIndex = self.defaults.integer(forKey: "tip_percentage_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
        self.calculateTip(defaultTipIndex as AnyObject)

        self.darkMode = defaults.bool(forKey: "dark_theme")
    }

    // fetch last values for less than 1 min
    func fetchLastValues() {
        let lastAccessedDate = self.defaults.object(forKey: "last_accessed_date") as! NSDate

        let timeInterval = lastAccessedDate.timeIntervalSinceNow * -1

        if timeInterval <= 60 {
            let lastbillAmount = self.defaults.string(forKey: "last_bill_amount")
            self.billField.text = lastbillAmount

            let lastTipIndex = self.defaults.integer(forKey: "last_percentage_index")
            tipControl.selectedSegmentIndex = lastTipIndex
            self.calculateTip(lastTipIndex as AnyObject)
        } else  {
            self.billField.text = ""
            self.fectchUserDefault()
        }
    }

    func setLastValues() {
        self.defaults.set(self.billField.text, forKey: "last_bill_amount")
        self.defaults.set(self.tipControl.selectedSegmentIndex, forKey: "last_percentage_index")
        self.defaults.set(NSDate(), forKey: "last_accessed_date")
        self.defaults.synchronize()
    }

    func setAppearance() {
        self.totalLabel.layer.masksToBounds = true
        self.totalLabel.layer.cornerRadius = 5

        self.tipLabel.layer.masksToBounds = true
        self.tipLabel.layer.cornerRadius = 5

        if self.darkMode {
            self.view.backgroundColor = UIColor(red: 153/255, green: 102/255, blue: 255/255, alpha: 1.0)
            let purple = UIColor(red: 102/255, green: 51/255, blue: 204/255, alpha: 1.0)
            self.billField.backgroundColor = purple
            self.tipLabel.backgroundColor = purple
            self.totalLabel.backgroundColor = purple
            self.tipControl.backgroundColor = purple
            self.billField.textColor = UIColor.white
            self.tipLabel.textColor = UIColor.white
            self.totalLabel.textColor = UIColor.white
            self.tipControl.tintColor = UIColor.white
        }else {
            self.view.backgroundColor = UIColor(red: 255/255, green: 204/255, blue: 153/255, alpha: 1.0)
            self.billField.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1.0)
            self.tipLabel.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1.0)
            self.totalLabel.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1.0)
            self.tipControl.backgroundColor = UIColor(red: 255/255, green: 153/255, blue: 51/255, alpha: 1.0)
            self.billField.textColor = UIColor.black
            self.tipLabel.textColor = UIColor.black
            self.totalLabel.textColor = UIColor.black
            self.tipControl.tintColor = UIColor.black
        }
    }

    // formatted number for total value
    func formatNumber(amount: Double) -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.maximumFractionDigits = 2
        let formattedAmount = numberFormatter.string(from: amount as NSNumber)
        return formattedAmount!
    }

    func fadeIn() {
        UIView.animate(withDuration: 0.5) {
            self.billField.alpha = 1.0
            self.totalLabel.alpha = 1.0
            self.tipLabel.alpha = 1.0
        }
    }

    func fadeOut() {
        UIView.animate(withDuration: 0.5) {
            self.billField.alpha = 0.4
            self.totalLabel.alpha = 0.4
            self.tipLabel.alpha = 0.4
        }
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }

    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]

        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip

        self.tipLabel.text = String(format: "$%.2f", tip)
        let totalAmount = self.formatNumber(amount: total)
        self.totalLabel.text = totalAmount
        if (self.totalLabel.text == "$0.00")
        {
            self.fadeOut()
        } else {
            self.fadeIn()
        }
    }
}
