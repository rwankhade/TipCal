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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func fectchUserDefault() {
        let defaults = UserDefaults.standard
        let defaultTipIndex = defaults.integer(forKey: "tip_percentage_index")
        tipControl.selectedSegmentIndex = defaultTipIndex
    }


    @IBAction func settingDefaultPercentage(_ sender: Any) {
        let selecetedTipIndex = tipControl.selectedSegmentIndex
        let defaults = UserDefaults.standard
        defaults.set(selecetedTipIndex, forKey: "tip_percentage_index")
        defaults.synchronize()
    }
}
