//
//  detailViewController.swift
//  College Profile Builder
//
//  Created by JScharm on 1/21/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

class detailViewController: UIViewController
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    
    var college : CollegesClass!
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        numberOfStudentsTextField.text = String(college.numberOfStudents)
        myImageView.image = college.image
    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
    }
    


}
