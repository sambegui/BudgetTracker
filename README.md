# Budget Tracker

[![Swift](https://img.shields.io/badge/swift-5.0-orange.svg)](https://swift.org)
[![Xcode](https://img.shields.io/badge/Xcode-12.0-blue.svg)](https://developer.apple.com/xcode/)

Budget Tracker is an iOS application that allows users to track their income and expenses efficiently. This app helps users manage their personal finances by categorizing transactions, calculating the balance, and providing an overview of their financial status.

## Features

- **Add Transactions:** Easily add income or expense transactions.
- **Categories:** Assign categories to transactions such as Food, Transport, Entertainment, etc.
- **Summary View:** Get a quick summary of total income, total expenses, and balance.
- **Delete Transactions:** Swipe left to delete transactions from the list.
- **Persistent Storage:** Transactions are stored using Core Data.
- **Portrait Mode Only:** The app is locked to portrait orientation to ensure a consistent user experience.

## Screenshots

![Home Screen](screenshots/home.png)
![Add Transaction](screenshots/add_transaction.png)
![Transaction Detail](screenshots/transaction_detail.png)
![Summary View](screenshots/summary.png)

## Requirements

- iOS 13.0+
- Xcode 12.0+
- Swift 5.0+

## Installation

1. Clone the repository:
    ```sh
    git clone https://github.com/sambegui/BudgetTracker.git
    ```
2. Navigate to the project directory:
    ```sh
    cd BudgetTracker
    ```
3. Open the project in Xcode:
    ```sh
    open BudgetTracker.xcodeproj
    ```
4. Build and run the project on your simulator or device.

## Usage

1. **Add a Transaction:** Click the "+" button to add a new transaction. Fill in the details such as title, amount, category, and whether it is an expense or income. Click "Save" to add the transaction.
2. **View Transaction Details:** Click on any transaction in the list to view its details.
3. **Delete a Transaction:** Swipe left on a transaction in the list to delete it.
4. **View Summary:** Click the "Summary" button on the top left to view a summary of your total income, total expenses, and balance.

## Contributing

Contributions are welcome! If you have any suggestions or improvements, please create an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgements

- [SwiftUI](https://developer.apple.com/xcode/swiftui/)
- [Core Data](https://developer.apple.com/documentation/coredata)

---

Developed by Samuel Beguiristain
