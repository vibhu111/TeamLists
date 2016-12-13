//
//
//  testUser
//
//  Created by Ramana Gandikota on 5/3/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit
import RealmSwift


let ListItem = ListItems()
class AddListViewController2: UIViewController {
    var selectedList : Lists!
    @IBOutlet var namefield: UITextField!
    
    @IBOutlet var descfield: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        descfield.text = ""
        descfield.layer.borderColor = UIColor.lightGray.cgColor
        descfield.layer.borderWidth = 2
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    
    @IBAction func saveAction(_ sender: AnyObject) {
        
       
displayAlertToAddTask(nil)
        self.navigationController?.popToRootViewController(animated: true)

       /*if namefield.text == "" {
            
            
            
            let alert = UIAlertView()
            alert.title = "Task Name"
            alert.message = "Name your Task before saving"
            alert.addButtonWithTitle("Ok")
            alert.show()
            
        } else {

        self.navigationController?.popToRootViewControllerAnimated(true)
        let ListItem = ListItems()
      self.ListItem.name = namefield.text!
            
        let realm = try! Realm()
        
        try! realm.write {
            realm.add(ListItem)
            
            
        }
        }*/
        
    }
    
    func displayAlertToAddTask(_ updatedTask:ListItems!){
        
        var title = "New Task"
        var doneTitle = "Create"
        if updatedTask != nil{
            title = "Update Task"
            doneTitle = "Update"
        }
        
        
      ListItem.name = namefield.text!
            
            if updatedTask != nil{
                // update mode
                
                let uiRealm = try! Realm().write({ () -> Void in
                    updatedTask.name = ListItem.name
                   
                })
            }
            else{
                
                let newTask = ListItems()
                

                newTask.name = ListItem.name
                newTask.desc = ListItem.desc
                let uiRealm = try! Realm().write({ () -> Void in
                    
              
                    
                    
                    
                   self.selectedList.tasks.append(newTask)
                    
                })
            }
        
            
            
            print(ListItem.name)
        }

    
}

