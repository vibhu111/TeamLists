//
//  MeViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/24/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit
import Parse

class MeViewController: UIViewController, UIImagePickerControllerDelegate {

    var idefault = NSUserDefaults()
    var ndefault = NSUserDefaults()
    let userHasOnboardedKey = "user_has_onboarded"
    @IBOutlet weak var imageView:UIImageView!
    
    @IBAction func profilePicButton(sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .PhotoLibrary
        
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
            
        }

    }

    @IBOutlet var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = ndefault.stringForKey("username")
        nameLabel.text = name

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logOutButton(sender: AnyObject) {
         _ = NSUserDefaults.standardUserDefaults().boolForKey(userHasOnboardedKey)
        PFUser.logOut()
        var currentUlet = PFUser.currentUser()
        if currentUlet == nil {
            sleep(1)
        performSegueWithIdentifier("signOut", sender: self)
            
            
            self.idefault.setBool(false, forKey: userHasOnboardedKey)
        
        
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
