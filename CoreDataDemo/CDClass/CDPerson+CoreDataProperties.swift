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
    @NSManaged public var toFriend: NSSet?

}

// MARK: Generated accessors for toFriend
extension CDPerson {

    @objc(addToFriendObject:)
    @NSManaged public func addToToFriend(_ value: CDFriend)

    @objc(removeToFriendObject:)
    @NSManaged public func removeFromToFriend(_ value: CDFriend)

    @objc(addToFriend:)
    @NSManaged public func addToToFriend(_ values: NSSet)

    @objc(removeToFriend:)
    @NSManaged public func removeFromToFriend(_ values: NSSet)

}

extension CDPerson : Identifiable {

}
