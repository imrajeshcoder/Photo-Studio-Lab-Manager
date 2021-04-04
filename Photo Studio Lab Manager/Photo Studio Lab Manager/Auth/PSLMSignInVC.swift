//
//  PSLMSignInVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit

class PSLMSignUpVC: UIViewController {

    @IBOutlet weak var txtOutletEmail: UITextField!
    @IBOutlet weak var txtOutletPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func btnActionSignupTouchUp(_ sender: UIButton) {
        if (validateTextField())
        {
            print("Validation Success")
        }
        else
        {
            print("Error In Validation")
        }
    }
    
    func validateTextField() -> Bool {
        if(txtOutletEmail.text == "" || txtOutletEmail.text!.trimmingCharacters(in: .whitespaces) == "" ){
            self.DisplayGlobalAlert(msg: "Please Enter Email Address")
            return false
        }
        else if (txtOutletEmail.text!.trimmingCharacters(in: .whitespaces).isValidEmail != true)
        {
            self.DisplayGlobalAlert(msg: "Please Enter Valid Email Address")
            return false
        }
        else if(txtOutletPassword.text == "" || txtOutletPassword.text!.trimmingCharacters(in: .whitespaces) == ""){
            self.DisplayGlobalAlert(msg: "Please Enter Password")
            return false
        }
        return true
    }

    @IBAction func btnActionLoginTouchUp(_ sender: Any) {
        if let vc = storyboard?.instantiateViewController(identifier: "PSLMLogInVC")as? PSLMLogInVC {
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
}
