//
//  ViewController.swift
//  application_1
//
//  Created by Lizaveta Rudzko on 3/2/1398 AP.
//  Copyright © 1398 Lizaveta Rudzko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var secondView: UIView!
    @IBOutlet var choose: UISegmentedControl!
    @IBOutlet var login: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var passwordAgain: UITextField!
    @IBOutlet var agreeLabel: UILabel!
    @IBOutlet var agreeSwitch: UISwitch!
    @IBOutlet var enterButton: UIButton!
    
    
    @IBAction func chooseSwitched(_ sender: Any) {
        if choose.selectedSegmentIndex == 0
        {
            secondView.isHidden = true
            enterButton.setTitle("Войти", for: .normal)
        }
        else
        {
            secondView.isHidden = false
            enterButton.setTitle("Зарегистрироваться", for: .normal)
        }
        login.text = ""
        password.text = ""
        passwordAgain.text = ""
        enterButton.isEnabled = false
        agreeSwitch.isOn = false
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.isHidden = true
    }


}

