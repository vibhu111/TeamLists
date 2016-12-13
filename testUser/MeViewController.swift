//
//  MeViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/24/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit

class MeViewController: UIViewController, UIImagePickerControllerDelegate {

    var idefault = UserDefaults()
    var ndefault = UserDefaults()
    let userHasOnboardedKey = "user_has_onboarded"
    @IBOutlet weak var imageView:UIImageView!
    
    @IBAction func profilePicButton(_ sender: AnyObject) {
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
        
            
            self.present(imagePicker, animated: true, completion: nil)
            
        }

    }

    @IBOutlet var nameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let name = ndefault.string(forKey: "username")
        nameLabel.text = name

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func logOutButton(_ sender: AnyObject) {
         _ = UserDefaults.standard.bool(forKey: userHasOnboardedKey)
        PFUser.logOut()
        let currentUlet = PFUser.current()
        if currentUlet == nil {
            sleep(1)
        performSegue(withIdentifier: "signOut", sender: self)
            
            
            self.idefault.set(false, forKey: userHasOnboardedKey)
        
        
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
