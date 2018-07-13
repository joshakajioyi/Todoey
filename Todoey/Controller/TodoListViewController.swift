//
//  ViewController.swift
//  Todoey
//
//  Created by Joshua Akajioyi on 11/07/2018.
//  Copyright © 2018 Joshua Akajioyi. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {
    
    var itemArrays = [Item]()
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArrays.append(newItem)

        let newItem2 = Item()
        newItem2.title = "Buy Eggs"
        itemArrays.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Buy Toast"
        itemArrays.append(newItem3)
        
        
        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
          itemArrays = items
    }
        
    }
    
    //MARK - TableView Datascource Methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemArrays.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
       
        let item = itemArrays[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done == true ? .checkmark : .none
        
         return cell
    }
    
    //MARK - TableView Delagate Methods
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print(itemArrays[indexPath.row])
        itemArrays[indexPath.row].done = !itemArrays[indexPath.row].done
        
        tableView.reloadData()
        tableView.deselectRow(at: indexPath, animated: true )
    }
    
    //Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Todoy Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            //What happens once user clicks the Add Items button on UIAlert
           
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArrays.append(newItem)
            
            self.defaults.set(self.itemArrays, forKey: "TodoListArray")
            
            self.tableView.reloadData()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add items here"
            textField = alertTextField
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
        
    }
    
    
}

