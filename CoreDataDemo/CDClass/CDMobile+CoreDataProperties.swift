//
//  CDMobile+CoreDataProperties.swift
//  CoreDataDemo
//
//  Created by Suraj on 12/11/23.
//
//

import Foundation
import CoreData


extension CDMobile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMobile> {
        return NSFetchRequest<CDMobile>(entityName: "CDMobile")
    }

    @NSManaged public var brand: String?
    @NSManaged public var version: String?
    @NSManaged public var number: String?
    @NSManaged public var toPerson: CDPerson?

}

extension CDMobile : Identifiable {

}
