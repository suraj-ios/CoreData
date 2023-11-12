//
//  CDFriend+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 12/11/23.
//
//

import Foundation
import CoreData


extension CDFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDFriend> {
        return NSFetchRequest<CDFriend>(entityName: "CDFriend")
    }

    @NSManaged public var firstName: String?
    @NSManaged public var lastName: String?
    @NSManaged public var toPerson: CDPerson?

}

extension CDFriend : Identifiable {

}
