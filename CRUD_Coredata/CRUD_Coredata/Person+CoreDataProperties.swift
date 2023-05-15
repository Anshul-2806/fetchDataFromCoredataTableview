//
//  Person+CoreDataProperties.swift
//  CRUD_Coredata
//
//  Created by macbook pro on 29/03/23.
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: NSObject?
    @NSManaged public var city: NSObject?
    @NSManaged public var address: NSObject?
    @NSManaged public var mobile: NSObject?

}

extension Person : Identifiable {

}
