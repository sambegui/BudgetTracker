//
//  SummaryView.swift
//  BudgetTracker
//
//  Created by Samuel Beguiristain on 6/13/24.
//

import SwiftUI
import CoreData

struct SummaryView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Transaction.date, ascending: false)],
        animation: .default)
    private var transactions: FetchedResults<Transaction>
    
    private var totalIncome: Double {
        transactions.filter { !$0.isExpense }.reduce(0) { $0 + $1.amount }
    }
    
    private var totalExpenses: Double {
        transactions.filter { $0.isExpense }.reduce(0) { $0 + $1.amount }
    }
    
    private var balance: Double {
        totalIncome - totalExpenses
    }

    var body: some View {
        GeometryReader { geometry in
            VStack {
                Text("Summary")
                    .font(.largeTitle)
                    .padding()
                
                HStack {
                    VStack {
                        Text("Total Income")
                            .font(.headline)
                        Text("\(totalIncome, specifier: "%.2f")")
                            .foregroundColor(.green)
                    }
                    .padding()
                    
                    VStack {
                        Text("Total Expenses")
                            .font(.headline)
                        Text("\(totalExpenses, specifier: "%.2f")")
                            .foregroundColor(.red)
                    }
                    .padding()
                }
                
                Text("Balance: \(balance, specifier: "%.2f")")
                    .font(.title)
                    .foregroundColor(balance >= 0 ? .green : .red)
                    .padding()
            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .position(x: geometry.size.width / 2, y: geometry.size.height / 2.5)
        }
        .padding()
    }
}

struct SummaryView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController.preview.container.viewContext
        let transaction1 = Transaction(context: context)
        transaction1.title = "Sample Income"
        transaction1.category = "Salary"
        transaction1.amount = 500.0
        transaction1.isExpense = false
        transaction1.date = Date()
        
        let transaction2 = Transaction(context: context)
        transaction2.title = "Sample Expense"
        transaction2.category = "Groceries"
        transaction2.amount = 150.0
        transaction2.isExpense = true
        transaction2.date = Date()
        
        return SummaryView()
            .environment(\.managedObjectContext, context)
    }
}
