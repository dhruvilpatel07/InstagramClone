//
//  ViewController.swift
//  InstagramClone
//
//  Created by Dhruvil Patel on 2020-11-20.
//

import UIKit
import FirebaseAuth

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        handleNotAuth()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
       
        
    }
    
    private func handleNotAuth(){
        //Check Auth status
        if Auth.auth().currentUser == nil {
            //Show login
            let loginVC = LoginViewController()
            loginVC.modalPresentationStyle = .fullScreen
            present(loginVC, animated: false)
        }
    }


}

