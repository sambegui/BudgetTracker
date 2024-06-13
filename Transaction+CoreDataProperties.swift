//
//  Transaction+CoreDataProperties.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//
//

import Foundation
import CoreData


extension Transaction {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Transaction> {
        return NSFetchRequest<Transaction>(entityName: "Transaction")
    }

    @NSManaged public var amount: Double
    @NSManaged public var category: String?
    @NSManaged public var date: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var isExpense: Bool
    @NSManaged public var title: String?

}

extension Transaction : Identifiable {

}
