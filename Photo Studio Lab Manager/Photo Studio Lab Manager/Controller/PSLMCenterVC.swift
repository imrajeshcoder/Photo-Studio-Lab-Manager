//
//  PSLMCenterVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit
import FAPanels
class PSLMCenterVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnActionmenu(_ sender: Any) {
        panel?.openLeft(animated: true)
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
