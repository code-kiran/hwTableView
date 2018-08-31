//
//  ViewController.swift
//  hwTableView
//
//  Created by kiran on 8/20/18.
//  Copyright © 2018 kiran. All rights reserved.
//

import UIKit
//var array1 = ["sdfsad","sdfasdf"]
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBAction func reloadTable(_ sender: Any) {
        array.removeAll()
        myTableView.reloadData()
        //myTableView.isEditing = true
    }
    @IBOutlet weak var myTableView: UITableView!
    var array = [String]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! cellVC
        let text1: String = array[indexPath.row] as String
        cell.cellLabel?.text = text1
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    

func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let editAction = UITableViewRowAction(style: .default, title: "Edit", handler: { (action, indexPath) in
            let alert = UIAlertController(title: "", message: "Edit list item", preferredStyle: .alert)
            alert.addTextField(configurationHandler: { (textField) in
                textField.text = self.array[indexPath.row]
            })
            alert.addAction(UIAlertAction(title: "Update", style: .default, handler: { (updateAction) in
                self.array[indexPath.row] = alert.textFields!.first!.text!
               self.myTableView.reloadRows(at: [indexPath], with: .fade)
            }))
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            self.present(alert, animated: false)
        })
        
        let deleteAction = UITableViewRowAction(style: .default, title: "Delete", handler: { (action, indexPath) in
            self.array.remove(at: indexPath.row)
            tableView.reloadData()
        })
        editAction.backgroundColor = UIColor.lightGray
        deleteAction.backgroundColor = UIColor.darkGray
        return [deleteAction, editAction]
    }

    

    
    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.myTableView.allowsMultipleSelectionDuringEditing = true
    }
    
    
    
    @IBAction func saveButton(_ sender: Any) {
     aappp()
    }
    
    
    
    func aappp(){
        let txt = txtField.text!
        if txt.isEmpty {
            let alert = UIAlertController(title: "Sorry", message: "textfield cant be empty", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alert, animated: true)
        }
        else {
            array.append(txtField.text!)
            print(array)
            myTableView.reloadData()
        }
    }
    
}

