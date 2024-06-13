//
//  TransactionViewModel.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import Foundation
import CoreData
import SwiftUI

class TransactionViewModel: ObservableObject {
    @Published var title: String = ""
    @Published var amount: String = ""
    @Published var isExpense: Bool = true
    @Published var date: Date = Date()
    @Published var category: String = "Uncategorized"
    
    let categories = ["Uncategorized", "Food", "Transport", "Entertainment", "Health", "Utilities", "Income"]

    private var context: NSManagedObjectContext

    init(context: NSManagedObjectContext) {
        self.context = context
    }

    func saveTransaction() {
        let newTransaction = Transaction(context: context)
        newTransaction.id = UUID()
        newTransaction.title = title
        newTransaction.amount = Double(amount) ?? 0
        newTransaction.isExpense = isExpense
        newTransaction.date = date
        newTransaction.category = category

        do {
            try context.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}
