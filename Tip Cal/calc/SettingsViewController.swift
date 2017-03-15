//
//  SettingsViewController.swift
//  calc
//
//  Created by Wankhade, Rachana on 3/2/17.
//  Copyright © 2017 Wankhade, Rachana. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var darkThemeSwitch: UISwitch!
    
    var darkMode: Bool = false
    var selectedTipIndex: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.fectchUserDefault()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fectchUserDefault() {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tip_percentage_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
        
        let darkMode = defaults.bool(forKey: "dark_theme")
        darkThemeSwitch.setOn(darkMode, animated: true)
    }


    @IBAction func settingDefaultPercentage(_ sender: Any) {
        self.selectedTipIndex = self.tipControl.selectedSegmentIndex
        self.setDefaultSetting()
    }
    
    @IBAction func themeSwitchValueChange(_ sender: Any) {
        self.darkMode = self.darkThemeSwitch.isOn
        self.setDefaultSetting()
    }
    
    func setDefaultSetting() {
        let defaults = UserDefaults.standard
        defaults.set(self.selectedTipIndex, forKey: "tip_percentage_index")
        defaults.set(self.darkMode, forKey: "dark_theme")
        defaults.synchronize()
    }
    
}
