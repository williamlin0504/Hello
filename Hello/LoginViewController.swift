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
        
        let center: Notification = NotificationCenter.default
        center.addObserver(self, selector: #selector(keyboardDidShow(notification:)),name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        center.addObserver(self, selector: #selector(keyboardWillHide(notification:)),name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  
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
    
    func keyboardDidShow(notifiction: Notification){
        let info:NSDictionary = notification.userInfo! as NSDictionary
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        let keyboardY = self.view.frame.size.height - keyboardSize.height
        
        let editingTextFieldY:CGFloat! = self.activeTextField?.frame.origin.y
        
        if editingTextFieldY > keyboardY - 60 {
            UIView.animate(withDuration: 0.25, delay: 0.0, options:UIViewAnimationOptions.curveEaseIn, animations: {
                self.view.frame = CGRect(x: 0, y: self.view.frame.origin.y-(editingTextFieldY! - (keyboardY - 60)),width: self.view.bounds.width, height: self.view.bounds.height)
                },completion: nil)
        }
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
