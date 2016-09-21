//  ViewController.swift
//  Contact
//  Created by Shashank Ranjan on 17/09/16.
//  Copyright © 2016 Shashank Ranjan. All rights reserved.

import UIKit
import CoreData

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    var contactlist:[Contact]?
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        contactlist = Contact.getcontact()
        tableview.reloadData()

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
   }
    
       
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
    if let contactlist = contactlist
    {
    return contactlist.count
    }
        else
    {
        
    return 0
    }
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        let person = contactlist![indexPath.row]
        cell.textLabel?.text = person.name
        print(person.name)
        print(person.no)
        return cell
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "gotodetail"
        {
            let selectedrow = self.tableview.indexPathForSelectedRow?.row
            let selectedPerson = contactlist![selectedrow!]
            let detailvc = segue.destinationViewController as? DetailViewController
            detailvc!.getcontactPerson = selectedPerson
        }
    }
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == UITableViewCellEditingStyle.Delete {
            let deletecontact = contactlist![indexPath.row]
            contactlist?.removeAtIndex(indexPath.row)
            Contact.deleteContact(deletecontact)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            tableview.reloadData()
        }
    }
     

}

