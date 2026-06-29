// Question 3: Classes & Objects (Difficulty: 3/5) ⭐⭐⭐
/// EXPECTED OUTPUT:
/// Account: 12345, Holder: Alice, Type: Savings, Balance: 800.0
/// Account: 67890, Holder: Bob, Type: Checking, Balance: 400.0
/// Account: 11111, Holder: Charlie, Type: Savings, Balance: 2000.0
/// Insufficient funds for withdrawal of 1000.0 from account 67890

// Create a BankAccount class with the following specifications:
class BankAccount {
  // 1. Properties:
  String accountNumber;
  String accountHolder;
  double balance;
  String accountType;

  // 2. Constructor:
  //    - Initialize all properties
  //    - Set initial balance to 0.0
  BankAccount(this.accountNumber, this.accountHolder, this.accountType)
      : balance = 0.0;

  // 3. Methods:
  //    - deposit(double amount): Add money to account
  void deposit(double amount) {
    balance += amount;
  }

  //    - withdraw(double amount): Remove money from account (check for sufficient funds)
  void withdraw(double amount) {
    if (amount <= balance) {
      balance -= amount;
    } else {
      print('Insufficient funds for withdrawal of $amount from account $accountNumber');
    }
  }

  //    - getBalance(): Return current balance
  double getBalance() {
    return balance;
  }

  //    - displayAccountInfo(): Show account details
  void displayAccountInfo() {
    print('Account: $accountNumber, Holder: $accountHolder, Type: $accountType, Balance: $balance');
  }
}

void main() {
  // 4. Create 3 bank accounts and demonstrate:

  // Create 3 bank accounts:
  var account1 = BankAccount('12345', 'Alice', 'Savings');
  var account2 = BankAccount('67890', 'Bob', 'Checking');
  var account3 = BankAccount('11111', 'Charlie', 'Savings');

  // Demonstrate depositing money:
  // Account 1: 1000.0, Account 2: 500.0, Account 3: 2000.0
  account1.deposit(1000.0);
  account2.deposit(500.0);
  account3.deposit(2000.0);

  // Demonstrate withdrawing money:
  // Account 1: 200.0, Account 2: 100.0
  account1.withdraw(200.0);
  account2.withdraw(100.0);

  // Display account information for all accounts
  account1.displayAccountInfo();
  account2.displayAccountInfo();
  account3.displayAccountInfo();

  // Demonstrate insufficient funds scenario:
  // Withdraw 1000.0 from Account 2
  account2.withdraw(1000.0);
}