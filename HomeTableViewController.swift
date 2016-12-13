//
//  HomeTableViewController.swift
//  testUser
//
//  Created by Ramana Gandikota on 5/4/15.
//  Copyright (c) 2015 VG. All rights reserved.
//

import UIKit
import RealmSwift

class HomeTableViewController: UITableViewController {
    
    var datasourcei :Results<Lists>!
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        datar()
       
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        //var hello =
        //println()
            
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        datar()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    // #warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 0
    }*/
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
      var xyz = 0
        // Return the number of rows in the section.
        if datasourcei != nil{
           xyz = datasourcei.count}
        return xyz
    }
    
    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    
    func datar(){
        let realm = try? Realm()
     datasourcei = realm?.objects(Lists)
        self.tableView.setEditing(false, animated: true)
        self.tableView.reloadData()
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        
        // Configure the cell...
        
        var currentInfo = datasourcei[indexPath.row]
        //
        //
        //WHY ARE THE LIST AND LISTITEM OBJECT CONNECTED!!!!!!!!
        var x = Lists()
        print (x)
        cell.listname.text = currentInfo.name
        cell.desclabel.text = currentInfo.desc
        return cell
    }
    
    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: "listitem", sender: self)
        
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let realm = try? Realm()
            try! realm!.write {
                realm!.delete (self.datasourcei[indexPath.row])
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
