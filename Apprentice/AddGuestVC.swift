//
//  ViewController.swift
//  Apprentice
//
//  Created by Pritesh Desai on 4/5/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate  {
    //text fields
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var numberText: UITextField!
    
    //button
    @IBOutlet weak var addDetailsButton: UIButton!
    
    //action to add guest details to the database
    @IBAction func addDetails(_ sender: Any) {
    
        let name = nameText.text
        let number = numberText.text
        
        //don't proceed if either of the input fields are empty
        if name == "" || number == "" {
            return
        }
        
        //create an object of type Guest
        let guest = Guest(name: name, number: number)
        
        //append the new object to the array
        Guests.append(guest!)
    
        //save the data to the local database
        saveData()
    
        //clear the input fields
        nameText.text = ""
        numberText.text = ""
    
        
        //display all the listings
        openReservationList(sender: sender)
    
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

