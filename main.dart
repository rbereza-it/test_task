// ignore_for_file: annotate_overrides

void main() {
  // Create three purses for each currency.
  var firstWallet = Wallet()
    ..addAmount(100)
    ..currency = Euro();
  var secondWallet = Wallet()
    ..addAmount(200)
    ..currency = Usd();
  var thirdWallet = Wallet()
    ..addAmount(300)
    ..currency = Uah();

  // Display wallets contents in console.
  void printWallet() {
    firstWallet.getAmount();
    secondWallet.getAmount();
    thirdWallet.getAmount();
    print('');
  }

  printWallet();

  // Transfer some sum from Euro and USD purses to Uah.
  firstWallet.transferTo(thirdWallet, 1);
  secondWallet.transferTo(thirdWallet, 1);

  printWallet();

  // Change the currency of all purses to Uah.
  firstWallet.changeWalletCurrency(Uah());
  secondWallet.changeWalletCurrency(Uah());

  printWallet();
}

class Currency {
  late String name;
  late String symbol;
  late double rateToUah;
}

class Euro extends Currency {
  String get name => 'Euro';
  String get symbol => '€';
  double get rateToUah => 30.67;
}

class Usd extends Currency {
  String get name => 'Usd';
  String get symbol => '\$';
  double get rateToUah => 27.09;
}

class Uah extends Currency {
  String get name => 'Uah';
  String get symbol => '₴';
}

class Wallet {
  double amount = 0.0;
  late Currency currency;

  // Add money to the wallet account.
  void addAmount(double amount) => this.amount += amount;

  // Transfer money from one purse to another.
  void transferTo(wallet, amount) {
    this.amount -= amount;
    wallet.amount += currency.symbol == Usd().symbol ? amount * Usd().rateToUah : amount * Euro().rateToUah;
  }

  // Change the currency of the purse.
  void changeWalletCurrency(newCurrency) {
    amount *= currency.symbol == Usd().symbol ? Usd().rateToUah : Euro().rateToUah;
    currency = newCurrency;
  }

  // Enter the console information about the purse.
  void getAmount() => print('$amount ${currency.symbol}');
}