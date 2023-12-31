//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Suraj on 11/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let context = CoreDataStack.sharedInstance.persistentContainer.viewContext
        
    var arrayList = [CDPerson]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "CoreData Demo"
                
        self.getAllItem()

    }
    
    func getAllItem(){
        
        do{
            arrayList = try context.fetch(CDPerson.fetchRequest())
        }
        catch let error{
            //
        }
        self.tableView.reloadData()
    }
    func createPersonMobileList(){
        let cdMobile = CDMobile(context: context)
        cdMobile.brand = "Apple"
        cdMobile.number = "9007126725"
        cdMobile.version = "16.0"
        
        let cdPerson = CDPerson(context: context)
        cdPerson.firstName = "Suraj"
        cdPerson.lastName = "Kumar"
        cdPerson.toMobile = cdMobile
        
        do{
            try context.save()
            self.getAllItem()
            
        }catch let error{
            //
        }
        
    }
    
    func deleteRecord(cdPerson:CDPerson){
        context.delete(cdPerson)
        do{
            try context.save()
            
            self.getAllItem()
        }
        catch let error{
            //
        }
    }
    
    @IBAction func createToDoListAction(_ sender: Any) {
        self.createPersonMobileList()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataTableViewCell", for: indexPath) as! CoreDataTableViewCell
        
        cell.delegate = self
        
        let item = self.arrayList[indexPath.row]
        cell.lblTitle.text = item.firstName! + " " + item.lastName!
        cell.deleteButton.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: CoreDataTableViewCellDelegate{
    func deleteToDoItem(indexNumber: Int) {
        let cdPerson = arrayList[indexNumber]
        self.deleteRecord(cdPerson: cdPerson)
        self.tableView.reloadData()
    }
    
}
