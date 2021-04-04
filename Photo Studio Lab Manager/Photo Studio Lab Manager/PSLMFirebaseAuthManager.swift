//
//  PSLMFirebaseAuthManager.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 27/02/21.
//

import FirebaseAuth
import Firebase
import UIKit

class FirebaseAuthManager {
    var ref = Database.database().reference()
    func createUser(email: String, password: String, completionBlock: @escaping (_ success: Int) -> Void) {
//        Auth.auth().createUser(withEmail: email, password: password) {(authResult, error) in
//            if let user = authResult?.user {
//                print(user)
//                completionBlock(true)
//            } else {
//                completionBlock(false)
//            }
//        }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
          if let error = error as? NSError {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
              // Error: The given sign-in provider is disabled for this Firebase project. Enable it in the Firebase console, under the sign-in method tab of the Auth section.
                completionBlock(1)
            case .emailAlreadyInUse:
              // Error: The email address is already in use by another account.
                completionBlock(2)
            case .invalidEmail:
              // Error: The email address is badly formatted.
                completionBlock(3)
            default:
                print("Error: \(error.localizedDescription)")
                completionBlock(4)
            }
          } else {
            print("User signs up successfully")
            let newUserInfo = Auth.auth().currentUser
            let email = newUserInfo?.email
            completionBlock(0)
          }
        }
    }
    
    func signIn(email: String, pass: String, completionBlock: @escaping (_ signInResult: Int) -> Void) {
        Auth.auth().signIn(withEmail: email, password: pass) { (authResult, error) in
          if let error = error as? NSError {
            switch AuthErrorCode(rawValue: error.code) {
            case .operationNotAllowed:
                completionBlock(1)
              // Error: Indicates that email and password accounts are not enabled. Enable them in the Auth section of the Firebase console.
            case .userDisabled:
              // Error: The user account has been disabled by an administrator.
                completionBlock(2)
            case .wrongPassword:
              // Error: The password is invalid or the user does not have a password.
                completionBlock(3)
            case .invalidEmail:
              // Error: Indicates the email address is malformed.
                completionBlock(4)
            default:
                print("Error: \(error.localizedDescription)")
                completionBlock(5)
            }
          } else {
            print("User signs in successfully")
            let userInfo = Auth.auth().currentUser
            let email = userInfo?.email
            completionBlock(0)
          }
        }
    }
    
   static func getUserName(userId: String) -> String {
        
    let ref = Database.database().reference()

    let userID = Auth.auth().currentUser?.uid
    ref.child("usermaster").observeSingleEvent(of: .value, with: { (snapshot) in
      // Get user value s
//      let value = snapshot.value as? NSDictionary
//     let username = value?["username"] as? String ?? ""
//    print(value)
//        print(username)

        for child in snapshot.children {
            let childSnap = child as! DataSnapshot
            let dict = childSnap.value as! [String: Any]
            let username = dict["username"] as! String
            let usermono = dict["usermono"] as! Int
            print("\n\n DATA HERE:---",childSnap.key, username, usermono)
        }
      // ...
      }) { (error) in
        print(error.localizedDescription)
    }
        return "aaa"
    }
   
}
