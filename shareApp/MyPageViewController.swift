//
//  MyPageViewController.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/07.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class MyPageViewController: UIViewController {

    @IBOutlet weak var logoutButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout_tapped(_ sender: Any) {
        
        UserDefaults.standard.set(false, forKey: "isUserLoggedIn")
        
        let storyboard: UIStoryboard = self.storyboard!
        let logout = storyboard.instantiateViewController(identifier: "firstView") as! ViewController
        self.present(logout, animated: true, completion: nil)
        
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
