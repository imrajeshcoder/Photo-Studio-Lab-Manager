//
//  PSLMSignInVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit

class PSLMSignUpVC: UIViewController {

    let FAM = FirebaseAuthManager()
    @IBOutlet weak var txtOutletEmail: UITextField!
    @IBOutlet weak var txtOutletPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()  
    }
    
    @IBAction func btnActionSignupTouchUp(_ sender: UIButton) {
        if (validateTextField())
        {
            print("Validation Success")
            FAM.createUser(email: txtOutletEmail.text!, password: txtOutletPassword.text!) { (createUserResult) in
                if (createUserResult == 0)
                {
                    self.DisplayGlobalAlert(msg: "Sign Up Done Please Login")
                    print("Successfully Create User")
                    if (self.storyboard?.instantiateViewController(identifier: "PSLMLogInVC")as? PSLMLogInVC) != nil {
                        self.navigationController?.popToRootViewController(animated: true)
                    }
                }
                else
                {
                    self.DisplayGlobalAlert(msg: dicCreateUserError[createUserResult]!)
                }
            }
        }
        else
        {
            self.DisplayGlobalAlert(msg: "Error In Validation")
        }
    }
    @IBAction func btnActionLoginTouchUp(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "PSLMLogInVC")as? PSLMLogInVC {
            self.navigationController?.popToRootViewController(animated: true)
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
}
