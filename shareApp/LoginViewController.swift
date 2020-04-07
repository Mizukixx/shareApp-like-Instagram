//
//  UserRegisterViewController.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/07.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.placeholder = "ユーザーネーム"
        password.placeholder = "パスワード"
        password.isSecureTextEntry = true
        
        //customize loginButton
        loginButton.backgroundColor = .black
        loginButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        loginButton.layer.borderColor = UIColor.lightGray.cgColor
        loginButton.layer.cornerRadius = 10

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButton_tapped(_ sender: Any) {
        
        let Username = userName.text
        let Password = password.text
        let UsernameStored = UserDefaults.standard.string(forKey: "Username")
        let PasswordStored = UserDefaults.standard.string(forKey: "Password")
        
        
        //confirm information
        if (Username == "") {
            DisplayAlertMessage(message: "ユーザーネームを入力してください")
        }
        if (Password == "") {
            DisplayAlertMessage(message: "パスワードを入力してください")
        }
        
        //login
        if (UsernameStored == Username) {
            
            if (PasswordStored == Password) {
                
                let storyboard: UIStoryboard = self.storyboard!
                let loginSuccess = storyboard.instantiateViewController(identifier: "tabBarController") as! UITabBarController
                UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
                self.present(loginSuccess, animated: true, completion: nil)
            }
        }
    }
    
    func DisplayAlertMessage(message: String) {
        
        let myAlert = UIAlertController(title: "エラー", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    @IBAction func toRegisterButton_tapped(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let toRegister = storyboard.instantiateViewController(identifier: "userRegister") as! UserRegisterViewController
        self.present(toRegister, animated: true, completion: nil)
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
