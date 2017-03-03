//
//  ListOfLists.swift
//  CaptainsLog
//
//  Created by Joy Umali on 3/2/17.
//  Copyright © 2017 Joy Umali. All rights reserved.
//


class ListOfLists {
    
    let nameOfList: String
    
    var list: [ToDoList] // this is the list of to do items from the second screen
    
    var completed: Bool
    
    init(nameOfList: String) {
        self.nameOfList = nameOfList
        self.completed = false
        self.list = [ToDoList(name: "Buy a boat.", completed: false)]
    }
    
}
