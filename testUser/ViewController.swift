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

     let infoitem = Lists()
    @IBOutlet var namefield: UITextField!
    
    @IBOutlet var descfield: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        descfield.text = ""
        descfield.layer.borderColor = UIColor.lightGray.cgColor
        descfield.layer.borderWidth = 2
        
    }

    func stuff(_ updatedList:Lists ){
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }


    
    @IBAction func saveAction(_ sender: AnyObject) {
        
   displayAlertToAddTaskList(nil)
self.navigationController?.popToRootViewController(animated: true)
       /* if namefield.text == "" {
        

                
            let alert = UIAlertView()
            alert.title = "List Name"
            alert.message = "Name your list before saving"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        } else {
            

        self.navigationController?.popToRootViewControllerAnimated(true)
        
        self.infoitem.name = self.namefield.text!
        self.infoitem.desc = self.descfield.text!
        
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(self.infoitem)}
        }*/

        
        
        
    }
    func displayAlertToAddTaskList(_ updatedList:Lists!){
        
        var title = "New Tasks List"
        var doneTitle = "Create"
        if updatedList != nil{
            title = "Update Tasks List"
            doneTitle = "Update"
        }
        self.infoitem.name = self.namefield.text!
        self.infoitem.desc = self.descfield.text!
            
            if updatedList != nil{
                // update mode
                
                
                let uiRealm = try! Realm().write({ () -> Void in
                    updatedList.name = self.infoitem.name
                  
                })
            }
            else{
                
                let newTaskList = Lists()
                newTaskList.name = self.infoitem.name
                newTaskList.desc = self.infoitem.desc
                let uiRealm = try! Realm()
                
                _ = try! Realm().write({ () -> Void in
                    
                    uiRealm.add(newTaskList)
                   
                })
            }
            
            
            
            print(self.infoitem.name)
        }
}

