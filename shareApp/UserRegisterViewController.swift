//
//  UserRegisterViewController.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/07.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class UserRegisterViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var passwordConfirm: UITextField!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var toLoginButton: UIButton!
    
    var timer: Timer = Timer()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        userName.placeholder = "ユーザーネーム(任意の英数字)"
        password.placeholder = "パスワード(任意の英数字で8文字以上)"
        passwordConfirm.placeholder = "確認のためもう一度パスワードを入力してください"

        password.isSecureTextEntry = true
        passwordConfirm.isSecureTextEntry = true
        
        //customize registerButton
        registerButton.backgroundColor = .black
        registerButton.setTitleColor(UIColor.white, for: UIControl.State.normal)
        registerButton.layer.borderColor = UIColor.lightGray.cgColor
        registerButton.layer.cornerRadius = 10
        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerButton_tapped(_ sender: Any) {
        
        let Username = userName.text
        let Password = password.text
        let PasswordConfirm = passwordConfirm.text
        
        //blank confirm
        if (Username == "" || Password == "" || PasswordConfirm == "") {
            DisplayAlertMessage(message: "すべてのフォームを入力してください")
            return
        }
        //password confirm
        if (Password != PasswordConfirm) {
            DisplayAlertMessage(message: "パスワードが一致しません")
            return
        }
        
        //registration
        UserDefaults.standard.set(Username, forKey: "Username")
        UserDefaults.standard.set(Password, forKey: "Password")
        UserDefaults.standard.set(true, forKey: "isUserLoggedIn")
        
        let myAlert = UIAlertController(title: "Alert", message: "登録が完了しました！", preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) {
            action in self.changeView()
        }
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    
    
    //Alert Message display
    func DisplayAlertMessage(message: String) {
        
        let myAlert = UIAlertController(title: "エラー", message: message, preferredStyle: UIAlertController.Style.alert)
        let okAction = UIAlertAction(title: "ok", style: UIAlertAction.Style.default, handler: nil)
        myAlert.addAction(okAction)
        self.present(myAlert, animated: true, completion: nil)
    }
    
    //segueなしで画面遷移
    @objc func changeView() {
        //create instance of storyboard
        let storyboard: UIStoryboard = self.storyboard!
        //create instance of destination View Controller (TopViewController)
        let nextView = storyboard.instantiateViewController(identifier: "topPage") as! TopViewController
        //move View and show
        self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func toLoginButton_tapped(_ sender: Any) {
        let storyboard: UIStoryboard = self.storyboard!
        let toLogin = storyboard.instantiateViewController(identifier: "login") as! LoginViewController
        self.present(toLogin, animated: true, completion: nil)
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
