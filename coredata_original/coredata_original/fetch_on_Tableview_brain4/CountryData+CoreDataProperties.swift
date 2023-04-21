//
//  CountryData+CoreDataProperties.swift
//  coredata_original
//
//  Created by macbook pro on 21/04/23.
//
//

import Foundation
import CoreData


extension CountryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryData> {
        return NSFetchRequest<CountryData>(entityName: "CountryData")
    }

    @NSManaged public var countryname: String?

}

extension CountryData : Identifiable {

}
