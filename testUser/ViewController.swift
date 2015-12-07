//
//  ViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/3/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    @IBOutlet var namefield: UITextField!
    
    @IBOutlet var descfield: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        descfield.text = ""
        descfield.layer.borderColor = UIColor.lightGrayColor().CGColor
        descfield.layer.borderWidth = 2
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return true
    }


    
    @IBAction func saveAction(sender: AnyObject) {
        
        self.navigationController?.popToRootViewControllerAnimated(true)
        let infoitem = Lists()
        infoitem.name = namefield.text!
        infoitem.desc = descfield.text!
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(infoitem)
            
        }
        
        
    }


}

