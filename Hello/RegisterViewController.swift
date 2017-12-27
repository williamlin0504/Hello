//
//  RegisterViewController.swift
//  Hello
//
//  Created by William_Lin on 2017/12/19.
//  Copyright © 2017年 William_Lin. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var username: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var confirm: UITextField!
    @IBOutlet var phone: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clearInput(_ sender: AnyObject) {        username.text = " "
        password.text = " "
        confirm.text = " "
        phone.text = " "
    }
    
}
