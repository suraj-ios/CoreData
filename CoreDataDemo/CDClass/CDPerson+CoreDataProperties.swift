//
//  CDPerson+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 12/11/23.
//
//

import Foundation
import CoreData


extension CDPerson {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDPerson> {
        return NSFetchRequest<CDPerson>(entityName: "CDPerson")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var toMobile: CDMobile?

}

extension CDPerson : Identifiable {

}
