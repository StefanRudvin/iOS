//
//  Meal.swift
//  iOSbasicUIApp
//
//  Created by Stefan Rudvin on 08/06/16.
//  Copyright © 2016 Stefan Rudvin. All rights reserved.
//

// Importing UIKit includes Foundation data structures
import UIKit

class Meal {
    // MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    // MARK: Initialization
    
    // Initializer prepares an instance of the class for use, setting an initial value for each property and performing any other setup or initialization.
    
    init?(name: String, photo: UIImage?, rating:Int){
        // Initialize stored properties
        self.name = name
        self.photo = photo
        self.rating = rating
        
        // Stop initialization if there is no name or if the rating is negative
        if name.isEmpty || rating < 0 {
            return nil
            // This means that the whole initilization can fail
        }
    }
}




