//
//  detailViewController.swift
//  College Profile Builder
//
//  Created by JScharm on 1/21/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit
import SafariServices

class detailViewController: UIViewController, SFSafariViewControllerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate
{
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    @IBOutlet weak var numberOfStudentsTextField: UITextField!
    @IBOutlet weak var webpageTextField: UITextField!
    
    var collegeMap : [CollegesClass] = []
    
    var college : CollegesClass!
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        nameTextField.text = college.name
        locationTextField.text = college.location
        numberOfStudentsTextField.text = String(college.numberOfStudents)
        myImageView.image = college.image
        webpageTextField.text = college.webpage
        imagePicker.delegate = self
    }

    @IBAction func saveButtonTapped(sender: UIButton)
    {
        college.name = nameTextField.text!
        college.location = locationTextField.text!
        college.numberOfStudents = Int(numberOfStudentsTextField.text!)!
        college.webpage = webpageTextField.text!
    }
    
    @IBAction func websiteButtonTapped(sender: UIButton)
    {
        let myURL = NSURL(string: college.webpage)
        let SVC = SFSafariViewController(URL: myURL!)
        SVC.delegate = self
        presentViewController(SVC, animated: true, completion: nil)
    }
    func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func photosButtonTapped(sender: UIButton)
    {
            imagePicker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            presentViewController(imagePicker, animated: true, completion: nil)
        
        }
        
        func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject])
        {
            imagePicker.dismissViewControllerAnimated(true) { () -> Void in
                let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
                self.myImageView.image = selectedImage
            }
            
    }
   
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let mapView = segue.destinationViewController as! mapViewController
        mapView.name = college.name
    }

}
