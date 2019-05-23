//
//  ViewController.swift
//  application_1
//
//  Created by Lizaveta Rudzko on 3/2/1398 AP.
//  Copyright © 1398 Lizaveta Rudzko. All rights reserved.
//

import UIKit

struct onlineCoursers
{
    let title: String
    let image: UIImage
}

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource 
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = onlineCoursersView.dequeueReusableCell(withReuseIdentifier: "onlinecourserscell", for: indexPath as IndexPath) as! onlineCoursersCell
        cell.title.text = Array(descriptions.keys)[indexPath.item]
        cell.image.image = UIImage.init(named: images[indexPath.item])!
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
    descriptionLabel.text = descriptions[Array(descriptions.keys)[indexPath.item]]
    
    return false
    }

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
    
    var descriptions: [String: String] = [:]
    var images = ["java.jpg", "cc++.jpg", "c#.jpg", "swift.jpg", "python.jpg", "ruby.jpg"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        secondView.isHidden = true
        onlineCoursersView.delegate = self
        onlineCoursersView.dataSource = self
        onlineCoursersView.isHidden = true
        
        //set data from plist
        var format = PropertyListSerialization.PropertyListFormat.xml
        let plistPath = Bundle.main.path(forResource: "onlineCoursers", ofType: "plist")
        let plistXML = FileManager.default.contents(atPath: plistPath!)
        do
        {
            descriptions = try PropertyListSerialization.propertyList(from: plistXML!, options: .mutableContainersAndLeaves, format: &format) as! [String: String]
        }
        catch { }
    }


}

