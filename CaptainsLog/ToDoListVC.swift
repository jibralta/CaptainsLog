//
//  ToDoListVC.swift
//  CaptainsLog
//
//  Created by Joy Umali on 3/2/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class ToDoListVC: UIViewController, UITableViewDataSource,UITableViewDelegate {

    
    @IBOutlet weak var listNameLabel: UILabel!
    @IBOutlet weak var addToDoField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var list = [ToDoList]()
    var listName = " "

    
// Dummy text for testing...
//        var list = [
//        "buy groceries",
//        "wash car",
//        "buy dog food",
//        "go on long hike",
//        "pay bills",
//        "fix leaky roof",
//        "buy and drink wine"
//        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // code to show the saved items of lists

//    list.append(addToDoField.text)
        listNameLabel.text = listName

    }
    
// checkk this add function code...
//    func add(_ toDoItem: String) {
//    
//        let name = addToDoField.text
//        let item = ToDoList(name: name!)
//        
//        list.append(item)
//
//    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoCell", for: indexPath) as! ToDoTableViewCell
        
        let item = list[indexPath.row]
        
        cell.toDoItemName.text = item.name

//        cell.toDoItemName.text = item // <-- checking with dummy values given above for the 'list' array
        
        return cell
    }
    
    @IBAction func addToDoEntered(_ sender: Any) {
        
        //add a new to do list
        
        let name = addToDoField.text
        let item = ToDoList(name: name!, completed: false)
        
        list.append(item)
        
//      list = list.reversed()
        tableView.reloadData()
        addToDoField.text = ""

    }
}
