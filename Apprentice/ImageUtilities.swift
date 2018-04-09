//
//  ImageUtilities.swift
//  Apprentice
//
//  Created by Pritesh Desai on 4/9/18.
//  Copyright © 2018 Little Maxima LLC. All rights reserved.
//

import UIKit

/*
 Utility functions to save image to disk and to load an image from disk
*/

//get the url for documents directory
let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!


//function to save image to the documents folder
func saveImage(_ image: UIImage, fileName: String) {
    
    //create the destination file url to save the image
    let fileURL = documentsDirectory.appendingPathComponent(fileName)
    
    //get the UIImage jpeg data representation and check if the destination file url already exists
    if let data = UIImageJPEGRepresentation(image, 1.0),
        !FileManager.default.fileExists(atPath: fileURL.path) {
        do {
            // writes the image data to disk
            try data.write(to: fileURL)
            print("file saved - \(fileURL)")
        } catch {
            print("error saving file:", error)
        }
    }
}



//return image from it's name
func getImage(withName imageName: String?) -> UIImage?
{
    
    //create the destination file url to save the image
    let fileURL = documentsDirectory.appendingPathComponent(imageName!)
    
    if FileManager.default.fileExists(atPath: fileURL.path){
        return UIImage(contentsOfFile: fileURL.path)
    }
    else{
        print("no image with the name - \(fileURL.absoluteString) found")
        return nil
    }
    
}
