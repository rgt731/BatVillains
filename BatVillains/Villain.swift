//
//  Villain.swift
//  BatVillains
//
//  Created by Robert Thompson on 11/1/17.
//  Copyright © 2017 Robert Thompson. All rights reserved.
//

import Foundation



public class Villain {
    
    var name: String?
    var alias: String?
    var imageName: String?
    var imageURL: String?
    var description: String?
    
    /*init() {
      //  timestamp = Date()
        
    }*/
    
    init( name: String, alias:String, imageName: String, description: String) {

        self.name = name
        self.alias = alias
        self.imageName = imageName
        self.description = description
    }
    
    convenience init(name: String, alias:String, imageURL: String, description: String) {
        self.init(name:name, alias:alias, imageURL : imageURL, description:description)
        
          
        self.imageURL = imageURL
    }
    
}

