//
//  PSLMLogInVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit

class PSLMLogInVC: UIViewController {

    @IBOutlet weak var txtOutletEmail: UITextField!
    @IBOutlet weak var txtOutletPassword: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnActionLoginTouchUp(_ sender: UIButton) {
        if validateTextField(){
            print("Validation True")
        }
        else
        {
            print("NOT")
        }
        
    }
    
    @IBAction func btnActionCreateUserTouchUp(_ sender: UIButton) {
    }
    
    func validateTextField() -> Bool {
        if(txtOutletEmail.text == "" || txtOutletEmail.text!.trimmingCharacters(in: .whitespaces) == "" ){
            self.DisplayGlobalAlert(msg: "Please Enter Email Address")
            return false
        }
        else if (txtOutletEmail.text!.trimmingCharacters(in: .whitespaces).isValidEmail != true)
        {
            return false
        }
        else if(txtOutletPassword.text == "" || txtOutletPassword.text!.trimmingCharacters(in: .whitespaces) == ""){
            self.DisplayGlobalAlert(msg: "Please Enter Password")
            return false
        }
        return true
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
