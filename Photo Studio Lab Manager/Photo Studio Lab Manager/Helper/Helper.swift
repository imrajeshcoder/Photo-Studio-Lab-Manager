//
//  Helper.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import Foundation
import UIKit

var AppName = " Photo Studio Lab Manager"

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
