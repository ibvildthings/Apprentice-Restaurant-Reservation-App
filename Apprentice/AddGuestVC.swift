//
//  ViewController.swift
//  Apprentice
//
//  Created by Pritesh Desai on 4/5/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate  {
    //text fields
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    
    //image
    @IBOutlet weak var guestPhoto: UIImageView!
    var imagePicker : UIImagePickerController!
    
    //button
    @IBOutlet weak var addDetailsButton: UIButton!
    
    //action to add guest details to the database
    @IBAction func addDetails(_ sender: Any) {
    
        let name = nameText.text
        let number = numberText.text
        let avatar = guestPhoto.image
        
        //don't proceed if either of the input fields are empty
        if name == "" || number == "" {
            return
        }
        
        //save the image with a "name + random digits"
        //this is done to avoid filename collision
        var randomImageName = name! + String(arc4random_uniform(99)) + ".jpg"
        
        saveImage(avatar!, fileName: randomImageName)
        
        //create an object of type Guest
        let guest = Guest(name: name, number: number, avatar: randomImageName)
        
        //append the new object to the array
        Guests.append(guest!)
    
        //save the data to the local database
        saveData()
    
        //clear the input fields and resets the imageview
        nameText.text = ""
        numberText.text = ""
        guestPhoto.image = #imageLiteral(resourceName: "default-avatar")
        
        //display all the listings
        openReservationList(sender: sender)
    
    }
    
    //take picture
    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.allowsEditing = false
            
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    //receive image from the camera
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any])
    {
        
        imagePicker.dismiss(animated: true, completion: nil)
        
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        print("Called")
        
        //update the image view with the image received from the camera
        guestPhoto.image = image
        
        
    }
    
    
    //display all the listings
    func openReservationList(sender: Any)
    {
        self.performSegue(withIdentifier: "showGuestList", sender:sender)
    }
    
    //used to dismiss keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //hide the navbar
        navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set the delegates for the text fields
        //used to dismiss keyboard
        self.nameText.delegate = self
        self.numberText.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

