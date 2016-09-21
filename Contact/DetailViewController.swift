//
//  DetailViewController.swift
//  Contact
//
//  Created by Shashank Ranjan on 18/09/16.
//  Copyright © 2016 Shashank Ranjan. All rights reserved.
//

import UIKit
import CoreData
import Foundation

class DetailViewController: UIViewController {
    
    var getcontactPerson:Contact?
    
    @IBOutlet weak var detailimage: UIImageView!
    @IBOutlet weak var contactLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        detailimage.layer.borderWidth = 1
        detailimage.layer.masksToBounds = false
        detailimage.layer.cornerRadius = detailimage.frame.height/2
        detailimage.clipsToBounds = true
        if getcontactPerson?.image != nil
        {
        detailimage.image = UIImage(data: (getcontactPerson?.image)!)
        }
        else{
             detailimage.image = UIImage(named: "contacticon.png")
        }
        if let getno = getcontactPerson?.no!{
        
            contactLabel.text = String(getno)
            
        }
        else
        {
        
        }
        if getcontactPerson?.name != nil
        {
        self.title = getcontactPerson?.name
        }
    }
}
