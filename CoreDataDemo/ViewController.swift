//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Suraj on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let context = CoreDataStack.coreDataStack.persistentContainer.viewContext
    
    private var todoListModel = [ClassModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "CoreData Demo"
                
        self.getAllToDoItem()
        
        let paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)
        print(paths[0])
        
    }
    
    func getAllToDoItem(){
        do{
            //todoListModel = try context.fetch(ToDoListItem.fetchRequest())
        }
        catch let error{
            //
        }
        
    }
    
    func createToDoItem(tempName:String){
//        let newItem = ToDoListItem(context: context)
//        newItem.name = tempName
//        newItem.createdAt = Date()
        
        //Save into core database
        do{
            try context.save()
            
            self.getAllToDoItem()
        }
        catch let error{
            //
        }
        
    }
    
    func deleteToDoItem(item: ClassModel){
        //context.delete(item)
        
        do{
            try context.save()
            self.getAllToDoItem()

        }
        catch let error{
            //
        }
    }
    
    func updateTodoItem(tempName:String, item: ClassModel){
        //item.name = tempName
        
        do{
            try context.save()
            self.getAllToDoItem()
        }
        catch let error{
            //
        }
    }
    
    
    
    @IBAction func createToDoListAction(_ sender: Any) {
        self.createToDoItem(tempName: "Test1")
        
        self.tableView.reloadData()
        
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.todoListModel.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataTableViewCell", for: indexPath) as! CoreDataTableViewCell
        
        cell.delegate = self
        
        let item = self.todoListModel[indexPath.row]
        //cell.lblTitle.text = item.name
        cell.deleteButton.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: CoreDataTableViewCellDelegate{
    func deleteToDoItem(indexNumber: Int) {
        let item = self.todoListModel[indexNumber]
        self.deleteToDoItem(item: item)
        
        self.tableView.reloadData()
    }
    
}
