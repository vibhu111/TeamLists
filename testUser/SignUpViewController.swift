//
//  SignUpViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/3/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var messageLabel2: UILabel!
    @IBOutlet var usernameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var messageLabel: UILabel!
    
    var idefault = UserDefaults()
    let userHasOnboardedKey = "user_has_onboarded"
    

    
    @IBAction func loginVerifyButton(_ sender: AnyObject) {
        var usrEntered = usernameTextField.text
        var pwdEntered = passwordTextField.text
        var emlEntered = emailTextField.text
        
        let userHasOnboardedKey = "user_has_onboarded"
        var iloggedin = UserDefaults.standard.bool(forKey: userHasOnboardedKey)
       
        
        func userSignUp() {
            
            var user = PFUser()
            user.username = usrEntered
            user.password = pwdEntered
            user.email = emlEntered
            
            user.signUpInBackground() {
                (succeeded: Bool, error: NSError?) -> Void in
                if error == nil {
                    // Hooray! Let them use the app now.
                    self.messageLabel.textColor = UIColor.blue
                    self.messageLabel.text = "User Signed Up"
                    sleep(2)
                    self.performSegue(withIdentifier: "signUpSegue", sender: self)
                    self.idefault.set(true, forKey: userHasOnboardedKey)

                    
                } else {
                    // Show the errorString somewhere and let the user try again.
                    
                    self.messageLabel.textColor = UIColor.red
                    self.messageLabel.text = "An error has occured"
                    self.messageLabel2.text = "Please enter valid information"

                    
                }
            }
            
            
        
            }
        
        if usrEntered != "" && pwdEntered != "" && emlEntered != "" {
            userSignUp()
            print("yay")
            // If not empty then yay, do something
        } else {
            self.messageLabel.text = "All Fields Required"
        }
        
        
        

        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

/*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)

        
    }*/
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.view.endEditing(true)
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
