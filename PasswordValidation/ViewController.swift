//
//  ViewController.swift
//  PasswordValidation
//
//  Created by AHMED on 7/2/20.
//  Copyright © 2020 AHMED. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var containsUpperCase = false
    var containsLowerCase = false
    var containNumber = false
    //MARK:-Outlets
    @IBOutlet weak var charactersLongImageView: UIImageView!
    @IBOutlet weak var upperCaseImageView: UIImageView!
    @IBOutlet weak var lowerCaseImageView: UIImageView!
    @IBOutlet weak var numberImageView: UIImageView!
    @IBOutlet weak var passwordMatchingImageView: UIImageView!
    
    
    @IBOutlet weak var passwordTxtField: UITextField!{
        didSet{
            passwordTxtField.addTarget(self, action: #selector(passwordDidChange), for: .editingChanged)
        }
    }
    @IBOutlet weak var confirmPasswordTxtField: UITextField!{
        didSet{
            confirmPasswordTxtField.addTarget(self, action: #selector(confirmPasswordDidChange), for: .editingChanged)
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:-Functions
    func checkOnCharactersLong() {
        if passwordTxtField.text?.count ?? 0 > 6 && passwordTxtField.text?.count ?? 0 < 20 {
            charactersLongImageView.image = UIImage.init(systemName: "checkmark.seal.fill")
            
        }else {
            charactersLongImageView.image = UIImage.init(systemName: "nosign")
        }
    }
    func checkOnUpperCaseLetters() {
        containsUpperCase = false
        passwordTxtField.text?.forEach({ (char) in
            if char.isUppercase {
                upperCaseImageView.image = UIImage.init(systemName: "checkmark.seal.fill")
                containsUpperCase = true
            }else {
                if containsUpperCase == false {
                    upperCaseImageView.image = UIImage.init(systemName: "nosign")
                }
            }
        })
    }
    func checkOnLowerCaseLetters() {
        containsLowerCase = false
        passwordTxtField.text?.forEach({ (char) in
            if char.isLowercase {
                lowerCaseImageView.image = UIImage.init(systemName: "checkmark.seal.fill")
                containsLowerCase = true
            }else {
                if containsLowerCase == false {
                    lowerCaseImageView.image = UIImage.init(systemName: "nosign")
                }
            }
        })
    }
    func checkOnNumbers() {
        containNumber = false
        passwordTxtField.text?.forEach({ (char) in
            if char.isNumber {
                numberImageView.image = UIImage.init(systemName: "checkmark.seal.fill")
                containNumber = true
            }else {
                if containNumber == false {
                    numberImageView.image = UIImage.init(systemName: "nosign")
                }
            }
        })
    }
    
    func checkIfPasswordIsMatching() {
        if passwordTxtField.text == confirmPasswordTxtField.text {
            passwordMatchingImageView.image = UIImage.init(systemName: "checkmark.seal.fill")
            
        }else {
            passwordMatchingImageView.image = UIImage.init(systemName: "nosign")
            
        }
    }
    func checkIfTxtFieldIsEmpty() {
        if passwordTxtField.text?.isEmpty ?? false {
            charactersLongImageView.image = UIImage.init(systemName: "nosign")
            upperCaseImageView.image = UIImage.init(systemName: "nosign")
            lowerCaseImageView.image = UIImage.init(systemName: "nosign")
            numberImageView.image = UIImage.init(systemName: "nosign")
            passwordMatchingImageView.image = UIImage.init(systemName: "nosign")
            
        }
    }
    
    @objc func passwordDidChange() {
        checkIfTxtFieldIsEmpty()
        checkOnCharactersLong()
        checkOnUpperCaseLetters()
        checkOnLowerCaseLetters()
        checkOnNumbers()
        
    }
    @objc func confirmPasswordDidChange() {
        checkIfPasswordIsMatching()
    }
    //MARK:-Actions
    @IBAction func validateBttnIsTapped(_ sender: Any) {
        if charactersLongImageView.image == UIImage.init(systemName: "checkmark.seal.fill") && upperCaseImageView.image == UIImage.init(systemName: "checkmark.seal.fill") && lowerCaseImageView.image == UIImage.init(systemName: "checkmark.seal.fill") && numberImageView.image == UIImage.init(systemName: "checkmark.seal.fill") && passwordMatchingImageView.image == UIImage.init(systemName: "checkmark.seal.fill") {
        let alert = UIAlertController(title: "Success", message: "Password are matched and valid", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(action)
        present(alert,animated: true,completion: nil)
    }else {
    let alert = UIAlertController(title: "Failed", message: "Please make sure that the password is valid according to the conditions", preferredStyle: .alert)
    let action = UIAlertAction(title: "Ok", style: .default, handler: nil)
    alert.addAction(action)
    present(alert,animated: true,completion: nil)
    }
}
}
