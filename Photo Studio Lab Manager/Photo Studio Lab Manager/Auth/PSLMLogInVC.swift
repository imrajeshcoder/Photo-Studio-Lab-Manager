//
//  PSLMLogInVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit
import FirebaseAuth
class PSLMLogInVC: UIViewController {
    @IBOutlet weak var txtOutletEmail: UITextField!
    @IBOutlet weak var txtOutletPassword: UITextField!
    let FAM = FirebaseAuthManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func btnActionLoginTouchUp(_ sender: UIButton) {
       // AppDelegate.navigateToMain()
        
        if validateTextField()
        {
            print("Validation True")
            FAM.signIn(email: String(txtOutletEmail.text!), pass: String(txtOutletPassword.text!)) { (signInResult) in
                print(signInResult)
                if (signInResult == 0)
                {
                    //print("Successfully login")
                    //print(Auth.auth().currentUser!.email!)
                    isLogin = true
                    userID = Auth.auth().currentUser!.uid
                   // userName = (Auth.auth().currentUser?.displayName)!
                    AppDelegate.navigateToMain()
                }
                else
                {
                    self.DisplayGlobalAlert(msg: dicSignInError[signInResult]!)
                }
                }
            }
            else
            {
                print("NOT")
            }
    }
    
    @IBAction func btnActionCreateUserTouchUp(_ sender: UIButton) {
        if let vc = storyboard?.instantiateViewController(identifier: "PSLMSignUpVC")as? PSLMSignUpVC {
            self.navigationController?.pushViewController(vc, animated: true)
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
