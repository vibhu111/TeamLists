//
//  LoginViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/3/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit
import Parse


class LoginViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var logInPassTextField: UITextField!
    @IBOutlet var loginInUserTextField: UITextField!
    var hi = "hi"
    var hi1 = "hi"
    var idefault = NSUserDefaults()
    let userHasOnboardedKey = "user_has_onboarded"
    var ndefault = NSUserDefaults()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            let userHasOnboardedKey = "user_has_onboarded"
            var iloggedin = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }

  /*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
        
    }*/

    
    @IBAction func loginButton(sender: AnyObject) {
        
        let userHasOnboardedKey = "user_has_onboarded"
        var iloggedin = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey)
      
       
        
        if loginInUserTextField.text != "" && logInPassTextField.text != "" {
            PFUser.logInWithUsernameInBackground(loginInUserTextField.text!, password: logInPassTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if error == nil {
                    
                    
            self.messageLabel.textColor = UIColor.redColor()
            self.messageLabel.text = "Logging In"
                    self.ndefault.setValue(self.loginInUserTextField.text, forKey: "username")

                    sleep(2)
                self.performSegueWithIdentifier("logInSegue", sender: self)
                    
            self.idefault.setBool(true, forKey: userHasOnboardedKey)

                
                } else {
                    
            self.messageLabel.text = "The username or password is incorrect"

                    print(error)
                }
            }            // Not Empty, Do something.
    } else {
            // Empty, Notify user
            self.messageLabel.text = "The username or password is incorrect"
        }

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
