//
//  Contact+CoreDataProperties.swift
//  Contact
//
//  Created by Shashank Ranjan on 18/09/16.
//  Copyright © 2016 Shashank Ranjan. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var name: String?
    @NSManaged var no: NSNumber?
    @NSManaged var image: NSData?

}
