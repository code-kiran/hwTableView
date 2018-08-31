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
    
    func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        return "Erase"
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            array.remove(at: indexPath.row)
            myTableView.deleteRows(at: [indexPath], with: .right)
        }
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
        array.append(txtField.text!)
           print(array)
        myTableView.reloadData()
        
    }
    
}

