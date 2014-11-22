//
//  TrainerSignUpViewController.swift
//  Find-A-Trainer
//
//  Created by Panafold on 11/13/14.
//  Copyright (c) 2014 Panafold. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class TrainerSignUpViewController: UIViewController, UINavigationControllerDelegate,UIImagePickerControllerDelegate{
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var chooseBuuton: UIButton!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var goalsTextField: UITextField!
    var imagePicker = UIImagePickerController()
    var imageFile: PFFile!;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        println("worked");
        self.navigationController?.navigationBarHidden=false;
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        imageView.image = image
        var imageBytes = UIImagePNGRepresentation(imageView.image)
        imageFile = PFFile(name: "pic.png", data: imageBytes)
        imageFile.saveInBackgroundWithBlock{(success: Bool, error: NSError!) -> Void in
            if success {
                println("Saved")
            } else {
                println("Error")
            }}
    }
    
    @IBAction func btnClicked(){
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            println("Button capture")
            
            
            imagePicker.delegate = self;
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
        
        //queryes list of trainees
        
        var query = PFQuery(className: "Trainee")
        query.findObjectsInBackgroundWithBlock({(NSArray objects, NSError error) in
            if (error != nil) {
                NSLog("error " + error.localizedDescription)
            }
            else {
                
                var results:NSArray = NSArray(array: objects)
                println(results.count)
            }
        })}
    
    @IBAction func saveUser(){
        var object:PFObject = PFObject(className: "Trainee")
        var name:String = nameTextField.text
        var goals:String = goalsTextField.text
        
        object.setObject(String(name), forKey: "name")
        
        object.setObject(String(goals), forKey: "goals")
        
        
        if(imageFile != nil){
            object.setObject(imageFile, forKey: "pic")
            object.saveInBackgroundWithBlock{(success: Bool, error: NSError!) -> Void in
                if success {
                    println("Saved it!!!!!")
                } else {
                    println("Error")
                }}
        }
        
    }
}

