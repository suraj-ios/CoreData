//
//  CDTeacher+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 14/11/23.
//
//

import Foundation
import CoreData


extension CDTeacher {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDTeacher> {
        return NSFetchRequest<CDTeacher>(entityName: "CDTeacher")
    }

    @NSManaged public var name: String?
    @NSManaged public var student: CDStudent?
    
}

extension CDTeacher : Identifiable {

}
