//
//  PSLMLeftMenuVC.swift
//  Photo Studio Lab Manager
//
//  Created by Vijay on 01/03/21.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
class PSLMLeftMenuVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
  
    
    @IBOutlet weak var imgOutletUserImage: UIImageView!
    
    @IBOutlet weak var lblOutletUserName: UILabel!
    @IBOutlet weak var tblOutletMenu: UITableView!
    var dicMenuOption  = [0 : ["menuName": "Home" , "menuVC": "PSLMhomeVC", "menuImage": "home"],
                          1 : ["menuName": "Order" , "menuVC": "PSLMorderVC", "menuImage": "oder"],
                          2 : ["menuName": "Customer" , "menuVC": "PSLMcustomerVC", "menuImage": "customer"],
                          3 : ["menuName": "Album Delivery" , "menuVC": "PSLMalbumdeliveryVC", "menuImage": "album-delivery"]]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tblOutletMenu.dataSource = self
        self.tblOutletMenu.delegate = self
        self.registerTableViewCells()
        // Do any additional setup after loading the view.
        setUserImageAndName()
        
    }
    
    private func registerTableViewCells() {
        let LeftMenuCell = UINib(nibName: "PSLMLeftMenuCell",
                                  bundle: nil)
        self.tblOutletMenu.register(LeftMenuCell,
                                forCellReuseIdentifier: "PSLMLeftMenuCell")
    }
    
    func setUserImageAndName() {
        imgOutletUserImage.layer.cornerRadius = 5
        lblOutletUserName.text = userID
        let storage = Storage.storage()
        var reference: StorageReference!
        reference = storage.reference(forURL: "gs://photo-studio-lab-manage.appspot.com/images/userimage/2KJwMwaOiYNDWeBrVQ9eczJZk4v2.png")
        reference.downloadURL { (url, error) in
            let data = NSData(contentsOf: url!)
            let image = UIImage(data: data! as Data)
            self.imgOutletUserImage.image = image
            print( FirebaseAuthManager.getUserName(userId: userID) )
        }
        
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dicMenuOption.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PSLMLeftMenuCell") as? PSLMLeftMenuCell {
            
            cell.imgOutletMenuImage.image = UIImage(named: dicMenuOption[indexPath.row]!["menuImage"]!)
            cell.lblOutletMenuName.text = dicMenuOption[indexPath.row]!["menuName"]
           // print(dicMenuOption[indexPath.row]!["menuName"]!)
                return cell
            }
            return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
            tableView.deselectRow(at: indexPath, animated: false)

            let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            var identifier = dicMenuOption[indexPath.row]!["menuVC"]
            let centerVC: UIViewController = mainStoryboard.instantiateViewController(withIdentifier: identifier!)
            let centerNavVC = UINavigationController(rootViewController: centerVC)
            
            panel!.configs.bounceOnCenterPanelChange = true

            panel!.center(centerNavVC, afterThat: {
                print("Executing block after changing center panelVC From Left Menu")
            })
        
    }

}
