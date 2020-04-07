//
//  ViewController.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/06.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(self.changeView), userInfo: nil, repeats: false)
    }
    
    //2秒後に自動的にトップページへ画面遷移
    @objc func changeView() {
        
        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
        let storyboard: UIStoryboard = self.storyboard!

        //if loggedin, move to TopPage
        if (isUserLoggedIn)
        {
            let toTopPage = storyboard.instantiateViewController(identifier: "tabBarController") as! UITabBarController
            self.present(toTopPage, animated: true, completion: nil)
        }
        //else if not loggedin, move to Login page
        else
        {
            let toLoginPage = storyboard.instantiateViewController(identifier: "login") as! LoginViewController
            self.present(toLoginPage, animated: true, completion: nil)
        }
    }
    


}

