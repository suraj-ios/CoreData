//
//  CDClass+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 14/11/23.
//
//

import Foundation
import CoreData


extension CDClass {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClass> {
        return NSFetchRequest<CDClass>(entityName: "CDClass")
    }

    @NSManaged public var name: String?
    @NSManaged public var student: CDStudent?

}

extension CDClass : Identifiable {

}
