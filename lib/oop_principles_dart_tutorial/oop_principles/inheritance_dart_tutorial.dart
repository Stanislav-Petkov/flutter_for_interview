// The example is from https://www.darttutorial.org/dart-tutorial/dart-inheritance/
class BankAccount {
  double _balance = 0;

  double get balance => _balance;

  deposit(double amount) {
    _balance += amount;
  }

  bool withdraw(double amount) {
    if (amount <= _balance) {
      _balance -= amount;
      return true;
    }
    return false;
  }
}

class SavingAccount extends BankAccount {
  double _interestRate = 0;

  double get interestRate => _interestRate;

  set interestRate(double value) {
    if (value > 0) {
      _interestRate = value;
    }
  }

  addInterest() {
    //_balance is from super class
    double interest = _balance * _interestRate;
    _balance += interest;
  }
}

void main() {
  var account = SavingAccount();
  // Call the super class(BankAccount) method
  account.deposit(1000);

  account.interestRate = 0.05;
  account.addInterest();

  print(account.balance);

  print('==============================');
  var accountS = SavingAccount();
  print(accountS is SavingAccount); // true
  print(accountS is BankAccount); // true
}