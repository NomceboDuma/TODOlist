//
//  Group+CoreDataProperties.swift
//  TODOlist
//
//  Created by Nomcebo Duma on 2023/03/23.
//
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var title: String?
    @NSManaged public var category: NSSet?

}

// MARK: Generated accessors for category
extension Group {

    @objc(addCategoryObject:)
    @NSManaged public func addToCategory(_ value: Task)

    @objc(removeCategoryObject:)
    @NSManaged public func removeFromCategory(_ value: Task)

    @objc(addCategory:)
    @NSManaged public func addToCategory(_ values: NSSet)

    @objc(removeCategory:)
    @NSManaged public func removeFromCategory(_ values: NSSet)

}

extension Group : Identifiable {

}
