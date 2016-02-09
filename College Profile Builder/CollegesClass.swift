//
//  CollegesClass.swift
//  College Profile Builder
//
//  Created by JScharm on 1/21/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

class CollegesClass: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    var webpage = ""
    
    
    init(Name: String, Location : String, NumberOfStudents : Int, Image: UIImage, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
        webpage = Webpage
    }
    init(Name: String, Location: String, NumberOfStudents: Int, Webpage: String)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        webpage = Webpage
    }

}
