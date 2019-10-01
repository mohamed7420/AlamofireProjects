//
//  ViewController.swift
//  AlamofireProjects
//
//  Created by Mohamed on 9/21/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit
import Alamofire


class LoginVC : UIViewController {

    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var usernameTF: UITextField!
    
    let url = "http://192.168.1.2/iOSApp/login.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     
        
    }
    
    @IBAction func btn_login(_ sender: UIButton) {
        
        login(url)
        
        
    }
    
    func login(_ url:String){
        
        guard let url = URL(string: url) ,
              let name = usernameTF.text ,
              let password = passwordTF.text else {return}
        
        let params :[String:Any] = ["name":name , "password":password]
        
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode:200..<600).responseJSON { (response) in
            
            switch response.result{
                
            case .success:
                print("login success")
            case .failure:
                print("login fail")
            }
            
        }
        
        
    }
    
  
}








