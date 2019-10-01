//
//  RegisterVC.swift
//  AlamofireProjects
//
//  Created by Mohamed on 9/21/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//
import UIKit
import Alamofire

class RegisterVC : UIViewController {
    
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    let API_URL:String = "http://192.168.1.2/iOSApp/Register.php"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
  
        
        
    }
    
    
    @IBAction func btn_Register(_ sender: UIButton) {
        
        send_Data(API_URL)
        
        
    }
    
    func send_Data(_ url:String){
        
        guard let url = URL(string: url) else {return}
        guard let name = nameTF.text else {return}
        guard let email = emailTF.text else {return}
        guard let password = passwordTF.text else {return}
        
        let params:[String:Any] = ["name":name , "email":email , "password":password]
        
        Alamofire.request(url, method: .post, parameters: params, encoding: URLEncoding.default, headers: nil).validate(statusCode: 200..<600).responseJSON { (response) in
            
            switch response.result{
                
            case .success :
                let alert = UIAlertController(title: "register user data", message: "Register successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(action)
                
                self.present(alert, animated: true)
                
            case .failure:
                
                print("user register successfully , Thanks")
                let alert = UIAlertController(title: "register user data", message: "Register successfully", preferredStyle: .alert)
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                
                alert.addAction(action)
                
                self.present(alert, animated: true)
            }
        }
        
    }
    
}
