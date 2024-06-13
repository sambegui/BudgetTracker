//
//  TransactionFormView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI

struct TransactionFormView: View {
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
                    Picker("Category", selection: $viewModel.category) {
                        ForEach(viewModel.categories, id: \.self) { category in
                            Text(category)
                        }
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

struct TransactionFormView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionFormView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
