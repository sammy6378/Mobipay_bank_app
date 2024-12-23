import 'package:flutter/material.dart';
import '../../widgets/recipient_header.dart';
import '../../widgets/amount_display.dart';
import '../../widgets/cards/balance_card.dart';
import 'success_screen.dart';

class TransferAmountScreen extends StatelessWidget {
  final String recipientName;
  final String accountNumber;
  final String? avatarUrl;
  final double amount;

  const TransferAmountScreen({
    super.key,
    required this.recipientName,
    required this.accountNumber,
    this.avatarUrl,
    this.amount = 320.00,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transfer Money',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              RecipientHeader(
                name: recipientName,
                accountNumber: accountNumber,
                avatarUrl: avatarUrl,
              ),
              const Spacer(),
              AmountDisplay(
                amount: amount,
                subtitle: 'No transfer fee',
              ),
              const SizedBox(height: 24),
              const BalanceCard(
                cardNumber: '9018',
                balance: 5300.00,
              ),
              const Spacer(),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SuccessScreen(
                        amount: amount,
                        recipientName: recipientName,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Send Money',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}