//
//  AddContactController.swift
//  Contact
//
//  Created by Shashank Ranjan on 17/09/16.
//  Copyright © 2016 Shashank Ranjan. All rights reserved.
//
import Foundation
import UIKit
import CoreData


class AddContactController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    @IBOutlet weak var imageview: UIImageView!
    @IBOutlet weak var imageButton: UIButton!
    @IBOutlet weak var nameLabel: UITextField!
    @IBOutlet weak var noLabel: UITextField!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
    }
    @IBAction func imageAction(sender: AnyObject) {
        
        imagePicker.sourceType = .SavedPhotosAlbum
        presentViewController(imagePicker, animated: true, completion: nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //imageView.contentMode = .ScaleAspectFit
            imageview.image = pickedImage
        }
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func saveAction(sender: AnyObject) {
        let appDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        let context = appDelegate?.managedObjectContext
        let saveQueue = dispatch_queue_create("saveQueue", DISPATCH_QUEUE_CONCURRENT)
        let entity = NSEntityDescription.entityForName("Contact", inManagedObjectContext: context!)
        let additem = Contact(entity: entity!, insertIntoManagedObjectContext: context)
        additem.name = self.nameLabel.text
       // print(additem.name)
        let someString = self.noLabel.text
        print(someString)
        
        if let number = Double(someString!)
        {
            //print("number =  \(number)")
              (additem.no) = number
           // print("no = \(additem.no!)")
        }
       // print(additem.no)
        dispatch_async(saveQueue) {
            
            // create NSData from UIImage
           if let getimage = self.imageview.image
           {
            let imagedata = UIImageJPEGRepresentation(getimage, 1)
            additem.setValue(imagedata, forKey: "image")
           }
           else
            {
            print("image is not set")
            
            }
            
        
            dispatch_async(dispatch_get_main_queue())
            {
                 self.dismissViewControllerAnimated(true, completion: nil)
            }
           
        
        do {
            try context?.save()
        }
        catch {
            print(error)
        }
        }
    }
    @IBAction func cancelAction(sender: AnyObject) {
    self.dismissViewControllerAnimated(true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
