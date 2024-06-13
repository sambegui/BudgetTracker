//
//  TransactionDetailView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI

struct TransactionDetailView: View {
    let transaction: Transaction

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Spacer(minLength: geometry.size.height * 0.2) // Adjust this value to control the vertical spacing
                Text(transaction.title ?? "Unknown Title")
                    .font(.largeTitle)
                    .padding()

                Text(String(format: "%.2f", transaction.amount))
                    .foregroundColor(transaction.isExpense ? .red : .green)
                    .font(.title)

                Text(transaction.date ?? Date(), style: .date) // Provide a default value for date
                    .font(.caption)

                Text(transaction.category ?? "No Category")
                    .font(.caption)

                Spacer() // This keeps the content vertically centered
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2.5)
        }
        .padding()
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let transaction = Transaction(context: context)
        transaction.title = "Sample Transaction"
        transaction.amount = 123.45
        transaction.isExpense = false
        transaction.date = Date()
        transaction.category = "Sample Category"

        return TransactionDetailView(transaction: transaction)
            .environment(\.managedObjectContext, context)
    }
}
