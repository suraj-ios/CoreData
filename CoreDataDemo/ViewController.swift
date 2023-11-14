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
    
    var arrayList = [CDClass]()

    var arrayTeacherList = [CDTeacher]()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.title = "CoreData Demo"
                
        //self.getAllItemOneToOne()
        
        self.getAllItemOneToMany()
        
    }
    
    func getAllItemOneToOne(){
        do{
            arrayList = try context.fetch(CDClass.fetchRequest())
        }
        catch let error{
            printContent(error.localizedDescription)
        }
        self.tableView.reloadData()

    }
    
    func getAllItemOneToMany(){
        do{
            arrayTeacherList = try context.fetch(CDTeacher.fetchRequest())
        }
        catch let error{
            //
        }
        
        self.tableView.reloadData()
    }
   
    func createOneToManyItem(){
        let cdStudent = CDStudent(context: context)
        cdStudent.name = "Student Name"
        
        let cdClass = CDTeacher(context: context)
        cdClass.name = "User"
        cdClass.student = cdStudent
        
        do{
            try context.save()
        }
        catch let error{
            //
        }
        self.getAllItemOneToMany()
    }
    
    func createPersonMobileList(){
       
        
    }
    
    func deleteRecord(cdPerson:CDClass){
        context.delete(cdPerson)
        
        do{
            try context.save()
        }
        catch let error{
            //
        }
        
        self.getAllItemOneToOne()
    }
    
    @IBAction func createToDoListAction(_ sender: Any) {
        self.createOneToManyItem()
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrayTeacherList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoreDataTableViewCell", for: indexPath) as! CoreDataTableViewCell
        
        cell.delegate = self
        
        let item = self.arrayTeacherList[indexPath.row]
        let student = item.student

        let str:String = (student?.name)!
        cell.lblTitle.text = item.name! + " : " + str
        cell.deleteButton.tag = indexPath.row
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}

extension ViewController: CoreDataTableViewCellDelegate{
    func deleteToDoItem(indexNumber: Int) {
        let cdPerson = arrayTeacherList[indexNumber]
        //self.deleteRecord(cdPerson: cdPerson)
        self.tableView.reloadData()
    }
    
}
