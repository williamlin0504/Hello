//
//  LoginViewController.swift
//  Hello
//
//  Created by William_Lin on 2017/12/19.
//  Copyright © 2017年 William_Lin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController , UITextFieldDelegate{
    @IBOutlet weak var login: UIButton!
    
    @IBOutlet var password: UITextField!
    @IBOutlet var user: UITextField!
    var activeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.user.delegate = self
        
        self.password.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func userShouldReturn(_ textField: UITextField) -> Bool {
         user.resignFirstResponder()
          return true
    }

    func passwordShouldReturn(_ textField: UITextField) -> Bool {
        password.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func keyboardWillHide(notifiction: Notification){
        UIView.animate(withDuration: 0.25, delay: 0.0, options:UIViewAnimationOptions.curveEaseIn, animations: {
            self.view.frame = CGRect(x: 0, y: 0,width: self.view.bounds.width, height: self.view.bounds.height)
        },completion: nil)
    }    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
