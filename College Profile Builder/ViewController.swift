//
//  ViewController.swift
//  College Profile Builder
//
//  Created by JScharm on 1/20/16.
//  Copyright © 2016 JScharm. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var colleges : [CollegesClass] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        
        colleges.append(CollegesClass(Name: "University of Florida", Location: "Gainesville, Florida", NumberOfStudents: 51725, Image: UIImage(named: "uf")!, Webpage: "http://www.ufl.edu/"))
        colleges.append(CollegesClass(Name: "Florida State University", Location: "Tallahassee, Florida", NumberOfStudents: 41473, Image: UIImage(named: "fsu")!, Webpage: "http://www.fsu.edu/"))
        colleges.append(CollegesClass(Name: "Stanford University", Location: "Stanford, California", NumberOfStudents: 16136, Image: UIImage(named: "stanford")!, Webpage: "https://www.stanford.edu/"))
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }

    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add College Name Here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (locationTextField) -> Void in
            locationTextField.placeholder = "Add College Location Here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (numberOfStudentsTextField) -> Void in
            numberOfStudentsTextField.placeholder = "Add Number of Students Here"
        }
        myAlert.addTextFieldWithConfigurationHandler { (webpageTextField) -> Void in
            webpageTextField.placeholder = "Add Website Here"
        }

        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let nameTF = myAlert.textFields![0] as UITextField
            let locationTextField = myAlert.textFields![1] as UITextField
            let numberTextField = myAlert.textFields![2] as UITextField
            let webpageTextField = myAlert.textFields![3] as UITextField
            self.colleges.append(CollegesClass(Name: nameTF.text!, Location: locationTextField.text!, NumberOfStudents: Int(numberTextField.text!)!, Webpage: webpageTextField.text!))
                
                
            self.myTableView.reloadData()
            
        }
        myAlert.addAction(addAction)
        
        
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!.text = colleges[indexPath.row].name
        myCell.detailTextLabel?.text = colleges[indexPath.row].location
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return colleges.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath)
    {
        if editingStyle == .Delete
        {
            colleges.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        let college = colleges[sourceIndexPath.row]
        colleges.removeAtIndex(sourceIndexPath.row)
        colleges.insert(college, atIndex: destinationIndexPath.row)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let detailView = segue.destinationViewController as! detailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = colleges[selectedRow!]
    }

}

