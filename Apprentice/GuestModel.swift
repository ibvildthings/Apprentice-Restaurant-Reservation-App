//
//  GuestModel.swift
//  Apprentice
//
//  Created by Pritesh Desai on 4/5/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import Foundation

//Guest object to store name and number for a guest
struct Guest : Codable {
    var name : String
    var number : String
    
    //init guest if name and number are both present
    init?(name: String?, number: String?) {
        
        //return without creating object if either field is nil
        if name == nil || number == nil {
            return nil
        }
        
        //else update the object
        self.name = name!
        self.number = number!
    }
    
} //end guest

//load the guests array from the local database
//if nil, start with an empty array
var Guests : [Guest] = loadData() ?? []

//function to get a path to the json file
func getDocumentsURL() -> URL {
    if let url = FileManager.default.urls(for: .cachesDirectory, in: .userDomainMask).first {
        return url
    } else {
        fatalError("Could not retrieve cache directory")
    }
}

//this saves the 'Guests' array to a json file on the iPhone's cache directory
func saveData() -> Bool
{
    //create a path to the json file
    let url = getDocumentsURL().appendingPathComponent("data.json")
    
    //encode data to JSON Data
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(Guests)
        //write this data to the url
        try data.write(to: url, options: [])
        
    } catch {
        return false
        //fatalError(error.localizedDescription)
    }
    
    return true
}


//this loads data from a json file into the 'Guests' array
func loadData() -> [Guest]?
{
    let url = getDocumentsURL().appendingPathComponent("data.json")
    let decoder = JSONDecoder()
    do {
        //retrieve the data on the json file
        let data = try Data(contentsOf: url, options: [])
        //decode an array of Guests
        let teams = try decoder.decode([Guest].self, from: data)
        return teams
    } catch {
        //fatalError(error.localizedDescription)
    }
    return nil
}
