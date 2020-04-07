//
//  TopViewController.swift
//  shareApp
//
//  Created by Kozasa Mizuki on 2020/04/06.
//  Copyright © 2020 Kozasa Mizuki. All rights reserved.
//

import UIKit

class TopViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: "post", for: indexPath) as! PostTableViewCell
        
        return cell
    }
    
    func configureTableView() {
        tableView.rowHeight = 500
    }

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
//        if (!isUserLoggedIn) {
//            let storyboard: UIStoryboard = self.storyboard!
//            let backToLogin = storyboard.instantiateViewController(identifier: "login") as! LoginViewController
//            self.present(backToLogin, animated: true, completion: nil)
//        }
        
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.register(UINib(nibName: "PostTableViewCell", bundle: nil), forCellReuseIdentifier: "post")

        // Do any additional setup after loading the view.
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
