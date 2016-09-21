//  Contact.swift
//  Contact
//  Created by Shashank Ranjan on 18/09/16.
//  Copyright © 2016 Shashank Ranjan. All rights reserved.

import Foundation
import CoreData
import UIKit


class Contact: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    
    static func getcontact() -> [Contact]? {
        
        var contacts: [Contact]?
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let context = appDelegate?.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Contact")
        
        do {
            try contacts = context?.executeFetchRequest(request) as? [Contact]
            return contacts!
           }
        catch
        {
            let nserror = error as NSError
            NSLog("Unresolved error \(nserror), \(nserror.userInfo)")
        }
        return [Contact]()
    }
    static func deleteContact(contacts: Contact) {
        
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        
        let context = appDelegate?.managedObjectContext
        
        context?.deleteObject(contacts)
        
        do {
            try context?.save()
        }
        catch {
            let nserror = error as NSError
            print(nserror)
        }
    }
}
