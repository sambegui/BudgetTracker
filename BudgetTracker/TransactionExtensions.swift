//
//  TransactionExtensions.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import Foundation
import CoreData

extension Transaction {
    var wrappedTitle: String {
        title ?? "Unknown Title"
    }

    var wrappedDate: Date {
        date ?? Date()
    }
}
