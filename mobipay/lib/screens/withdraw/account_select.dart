import 'package:flutter/material.dart';
import 'withdraw_screen.dart';
import 'package:mobipay/widgets/cards/balance_card.dart';

class AccountSelectionScreen extends StatelessWidget {
  const AccountSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Example account data
    final accounts = [
      {'cardNumber': '1234', 'balance': 1500.50},
      {'cardNumber': '5678', 'balance': 320.75},
      {'cardNumber': '9012', 'balance': 840.00},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Select Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: accounts.length,
          itemBuilder: (context, index) {
            final account = accounts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        WithdrawScreen(account: '**** ${account['cardNumber']}'),
                  ),
                );
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: BalanceCard(
                  cardNumber: account['cardNumber'] as String,
                  balance: account['balance'] as double,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
