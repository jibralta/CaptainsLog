//
//  ListVC.swift
//  CaptainsLog
//
//  Created by Joy Umali on 3/2/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//

import UIKit

class ListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var addListNameField: UITextField!
    
    var listOfLists = [ListOfLists]()
    
    var selectedIndexPath: IndexPath?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        listOfLists.append(ListOfLists(nameOfList: "Prepare for Journey Through the Seven Seas!"))
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListNameCell", for: indexPath) as! ListTableViewCell
        
        let item = listOfLists[indexPath.row]
        
        cell.listName.text = item.nameOfList
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // user selected an index path
        selectedIndexPath = indexPath
        
        //segue into the next view
        self.performSegue(withIdentifier: "To_ToDoList", sender: self)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if let destination = segue.destination as? ToDoListVC {
            
            if let selectedIndexPath = selectedIndexPath {
                
                destination.list = listOfLists[selectedIndexPath.row].list
                
                destination.listName = listOfLists[selectedIndexPath.row].nameOfList
                
                // sender is the to do list title which is the data in the selected row
            }
        }
}

    @IBAction func addListNameEntered(_ sender: Any) {
        // add a new list to the list of lists
        
        let name = addListNameField.text
        let item = ListOfLists(nameOfList: name!)
        
        
        listOfLists.append(item)
        
        firstTableView.reloadData()
        addListNameField.text = ""
    }
}
