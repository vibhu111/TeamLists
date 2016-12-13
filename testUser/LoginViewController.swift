//
//  LoginViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/3/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var logInPassTextField: UITextField!
    @IBOutlet var loginInUserTextField: UITextField!
    var hi = "hi"
    var hi1 = "hi"
    var idefault = UserDefaults()
    let userHasOnboardedKey = "user_has_onboarded"
    var ndefault = UserDefaults()
    
        override func viewDidLoad() {
        super.viewDidLoad()
            let userHasOnboardedKey = "user_has_onboarded"
            var iloggedin = UserDefaults.standard.bool(forKey: userHasOnboardedKey)
        
            
            
            
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }

  /*
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        
        self.view.endEditing(true)
        
        
    }*/

    
    @IBAction func loginButton(_ sender: AnyObject) {
        
        let userHasOnboardedKey = "user_has_onboarded"
        var iloggedin = UserDefaults.standard.bool(forKey: userHasOnboardedKey)
      
       
        
        if loginInUserTextField.text != "" && logInPassTextField.text != "" {
            PFUser.logInWithUsername(inBackground: loginInUserTextField.text!, password: logInPassTextField.text!) {
                (user: PFUser?, error: NSError?) -> Void in
                if error == nil {
                    
                    
            self.messageLabel.textColor = UIColor.red
            self.messageLabel.text = "Logging In"
                    self.ndefault.setValue(self.loginInUserTextField.text, forKey: "username")

                    sleep(2)
                self.performSegue(withIdentifier: "logInSegue", sender: self)
                    
            self.idefault.set(true, forKey: userHasOnboardedKey)

                
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
