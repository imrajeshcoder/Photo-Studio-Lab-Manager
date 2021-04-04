//
//  Helper.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import Foundation
import UIKit

var AppName = " Photo Studio Lab Manager"
var dicSignInError = [0: "Success" ,
                      1: "SignIn Operation Not Allowed In Database " ,
                      2: "This User Is Disabled Please Contact Adminstartor" ,
                      3: "Password Is Wrong" ,
                      4: "invalid Email",
                      5: "Email Address Not Found"
                      ]
var dicCreateUserError = [0: "Success" ,
                      1: "User Create Operation Not Allowed In Database " ,
                      2: "Email Id Allready Exist" ,
                      3: "Enter Valid Email Id" ,
                      4: "Error in Create user"
                      ]

extension UIViewController {
//    func reloadViewFromNib() {
//        let parent = view.superview
//        view.removeFromSuperview()
//        view = nil
//        parent?.addSubview(view) // This line causes the view to be reloaded
//    }
    
    func DisplayGlobalAlert(msg: String) {
        let alert = UIAlertController(title: AppName, message: msg, preferredStyle: .alert)
        let ok = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(ok)
        DispatchQueue.main.async(execute: {
            self.present(alert, animated: true)
        })
        
    }
    
}

extension String {
    var isValidEmail: Bool {
        NSPredicate(format: "SELF MATCHES %@", "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: self)
    }
    
}


var isLogin : Bool{
    get{
        if UserDefaults.standard.value(forKey: "isLogin") != nil{
            return (UserDefaults.standard.value(forKey: "isLogin") as? Bool)!
        }
        return false
    }
    
    set{
        UserDefaults.standard.set(newValue, forKey: "isLogin")
    }
    
}

var userID : String{
    
    get{
        if UserDefaults.standard.value(forKey: "userID") != nil{
            return (UserDefaults.standard.value(forKey: "userID") as? String)!
        }
        return ""
    }
    
    set{
        UserDefaults.standard.set(newValue, forKey: "userID")
    }
    
}

var userName : String{
    
    get{
        if UserDefaults.standard.value(forKey: "userName") != nil{
            return (UserDefaults.standard.value(forKey: "userName") as? String)!
        }
        return ""
    }
    
    set{
        UserDefaults.standard.set(newValue, forKey: "userName")
    }
    
}

