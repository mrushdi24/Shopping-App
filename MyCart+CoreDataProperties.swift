//
//  MyCart+CoreDataProperties.swift
//  
//
//  Created by KNA on 29/11/2021.
//
//

import Foundation
import CoreData


extension MyCart {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MyCart> {
        return NSFetchRequest<MyCart>(entityName: "MyCart")
    }

    @NSManaged public var quantity: String?
    @NSManaged public var id: Int64

}
