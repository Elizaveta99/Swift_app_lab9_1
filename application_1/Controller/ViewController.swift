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
    @IBOutlet var onlineCoursersView: UICollectionView!
    @IBOutlet var descriptionLabel: UILabel!
    
    
    @IBAction func chooseSwitched(_ sender: Any) {
        if choose.selectedSegmentIndex == 0
        {
            secondView.isHidden = true
            enterButton.setTitle("Войти", for: .normal)
            enterButton.isEnabled = true
        }
        else
        {
            secondView.isHidden = false
            enterButton.setTitle("Зарегистрироваться", for: .normal)
            enterButton.isEnabled = false
        }
        login.text = ""
        password.text = ""
        passwordAgain.text = ""
        agreeSwitch.isOn = false
    }
    
    @IBAction func agreeSwitchTapped(_ sender: Any) {
        if choose.selectedSegmentIndex == 1 {
            enterButton.isEnabled = !enterButton.isEnabled
        }
    }
    
    @IBAction func enterButtonTapped(_ sender: Any) {
        if choose.selectedSegmentIndex == 0
        {
            let savedPassword = UserDefaults.standard.object(forKey: self.login.text!)
            if savedPassword != nil
            {
                if ((savedPassword! as! String).elementsEqual(password.text!)) == true
                {
                    onlineCoursersView.isHidden = false
                    descriptionLabel.isHidden = false
                }
            }
        }
        else
        {
            if ((login.text?.elementsEqual(""))! || (password.text?.elementsEqual(""))! || (passwordAgain.text?.elementsEqual(""))!) == false
            {
                if (passwordAgain.text)!.elementsEqual(password.text!)
                {
                    UserDefaults.standard.set(password.text, forKey: login.text!)
                    onlineCoursersView.isHidden = false
                    descriptionLabel.isHidden = false
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.isHidden = true
        onlineCoursersView.isHidden = true
    }


}

