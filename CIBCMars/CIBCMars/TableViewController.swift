//
//  TableViewController.swift
//  CIBCMars
//
//  Created by Elvina Tse on 2015-11-19.
//  Copyright © 2015 Elvina Tse. All rights reserved.
//

import UIKit

// Choose "Cocoa" to create this file -> subclass of UIViewController etc.
class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let modelNames = Name()
    
    // Get this from UITableViewDataSource by Cmd+clicking it ^ and copy/pasting not optional ones
    // Can make this a code snippet by highlighting then (fn+)dragging into Code Snippet Library (lower right corner)
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelNames.names.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        // "?" checks cell to see if it is nill first. Only changes text if it is NOT nill, i.e. it exists
        // Delegate method, so kind of like a for loop but runs automatically - can get indexPath for each row that is being created -> number that can be used for the names array
        cell.textLabel?.text = modelNames.names[indexPath.row]
        
        return cell
    }
    /*func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }*/

    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "controllerSegue" {
            performSegueWithIdentifier("controllerSegue", sender: self)
        }
    }
    

}
