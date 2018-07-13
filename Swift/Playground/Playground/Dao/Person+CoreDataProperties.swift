//
//  Person+CoreDataProperties.swift
//  Playground
//
//  Created by Warm-mac on 2018/7/12.
//  Copyright © 2018年 Warm-mac. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var name: String?

}
