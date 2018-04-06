//
//  GuestListViewController.swift
//  Apprentice
//
//  Created by Pritesh Desai on 4/6/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import UIKit

class GuestListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    @IBAction func goBack(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Table view data source
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Guests.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell2"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        //update the labels
        cell.textLabel?.text = Guests[indexPath.row].name
        cell.detailTextLabel?.text = Guests[indexPath.row].number
        return cell
    }
    
    //call the number when cell is clicked
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row >= 0 && indexPath.row < Guests.count)
        {
            let phoneNumber: String = "tel://" + Guests[indexPath.row].number
            UIApplication.shared.openURL(URL(string: phoneNumber)!)
        }
    }
    
    // Override to support editing the table view.
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            Guests.remove(at: indexPath.row)
            saveData()
            
            //delete from the table view
            tableView.deleteRows(at: [indexPath], with: .top)
            
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

}
