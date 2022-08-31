//
//  Animal+CoreDataProperties.swift
//  Zoo
//
//  Created by Phantom on 13/6/2022.
//
//

import Foundation
import CoreData


extension Animal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Animal> {
        return NSFetchRequest<Animal>(entityName: "Animal")
    }

    @NSManaged public var imageURL: URL?
    @NSManaged public var kind: String?
    @NSManaged public var numberOfLegs: Int16

}

extension Animal : Identifiable {

}
