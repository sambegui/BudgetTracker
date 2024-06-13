//
//  ContentView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Transaction.date, ascending: false)],
        animation: .default)
    private var transactions: FetchedResults<Transaction>

    @State private var showingAddTransaction = false

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(transactions) { transaction in
                        NavigationLink(destination: TransactionDetailView(transaction: transaction)) {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(transaction.title ?? "Unknown Title")
                                    Text(transaction.category ?? "No Category")
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
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
                        Button(action: {
                            showingAddTransaction = true
                        }) {
                            Label("Add Transaction", systemImage: "plus")
                        }
                    }
                    ToolbarItem(placement: .topBarLeading) {
                        NavigationLink(destination: SummaryView()) {
                            Text("Summary")
                        }
                    }
                }
                .sheet(isPresented: $showingAddTransaction) {
                    TransactionFormView()
                        .environment(\.managedObjectContext, viewContext)
                }
            }
        }
        .portraitOnly() // Apply the portrait only modifier
    }

    private func deleteTransactions(offsets: IndexSet) {
        withAnimation {
            offsets.map { transactions[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Handle the error appropriately
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let transaction = Transaction(context: context)
        transaction.title = "Sample Transaction"
        transaction.category = "Sample Category"
        transaction.amount = 123.45
        transaction.isExpense = true
        transaction.date = Date()

        return ContentView()
            .environment(\.managedObjectContext, context)
    }
}
