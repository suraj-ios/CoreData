//
//  CDStudent+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 14/11/23.
//
//

import Foundation
import CoreData


extension CDStudent {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDStudent> {
        return NSFetchRequest<CDStudent>(entityName: "CDStudent")
    }

    @NSManaged public var name: String?
    @NSManaged public var classes: CDClass?
    @NSManaged public var teacher: NSSet?

}

// MARK: Generated accessors for teacher
extension CDStudent {

    @objc(addTeacherObject:)
    @NSManaged public func addToTeacher(_ value: CDTeacher)

    @objc(removeTeacherObject:)
    @NSManaged public func removeFromTeacher(_ value: CDTeacher)

    @objc(addTeacher:)
    @NSManaged public func addToTeacher(_ values: NSSet)

    @objc(removeTeacher:)
    @NSManaged public func removeFromTeacher(_ values: NSSet)

}

extension CDStudent : Identifiable {

}
