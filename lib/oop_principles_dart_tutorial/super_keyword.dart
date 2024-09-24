//https://www.darttutorial.org/dart-tutorial/dart-super/
// READ the article while reading the code
class BankAccount {
  double _balance = 0;

  BankAccount({double balance = 0}) : _balance = balance;

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

  SavingAccount({double balance = 0, double interestRate = 0})
      : _interestRate = interestRate,
        super(balance: balance);

  double get interestRate => _interestRate;

  set interestRate(double value) {
    if (value > 0) {
      _interestRate = value;
    }
  }

  addInterest() {
    double interest = _balance * _interestRate;
    this._balance += interest;
  }
}


void main() {
  var account = SavingAccount(balance: 1000, interestRate: 0.05);
  account.addInterest();

  print(account.balance);
}
