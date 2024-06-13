//
//  TransactionListView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI
import CoreData

struct TransactionListView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Transaction.date, ascending: false)],
        animation: .default)
    private var transactions: FetchedResults<Transaction>

    var body: some View {
        NavigationView {
            List {
                ForEach(transactions) { transaction in
                    NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                        HStack {
                            VStack(alignment: .leading) {
                                Text(transaction.title ?? "Unknown Title")
                                Text(transaction.category ?? "Uncategorized")
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            Spacer()
                            Text(String(format: "%.2f", transaction.amount))
                                .foregroundColor(transaction.isExpense ? .red : .green)
                        }
                    }
                }
                .onDelete(perform: deleteTransactions)
            }
            .navigationTitle("Budget Tracker")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    NavigationLink(destination: TransactionFormView()) {
                        Label("Add Transaction", systemImage: "plus")
                    }
                }
            }
        }
    }

    private func deleteTransactions(offsets: IndexSet) {
        withAnimation {
            offsets.map { transactions[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}
