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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listNameLabel.text = listName
        
        list.append(ToDoList(name: "Swab the deck!", completed: false))
        list.append(ToDoList(name: "Stock the bar!!", completed: false))
        list.append(ToDoList(name: "Patch the leaks.", completed: false))
        list.append(ToDoList(name: "Find the first mate.", completed: false))
        list.append(ToDoList(name: "Hire crew", completed: false))
        list.append(ToDoList(name: "Train crew to fend off pirates.", completed: false))
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
