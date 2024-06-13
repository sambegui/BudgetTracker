//
//  AddTransactionView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI

struct AddTransactionView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @StateObject private var viewModel = TransactionViewModel(context: PersistenceController.shared.container.viewContext)
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    TextField("Title", text: $viewModel.title)
                    TextField("Amount", text: $viewModel.amount)
                        .keyboardType(.decimalPad)
                    Toggle(isOn: $viewModel.isExpense) {
                        Text("Expense")
                    }
                }
            }
            .navigationTitle("Add Transaction")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        viewModel.saveTransaction()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}
