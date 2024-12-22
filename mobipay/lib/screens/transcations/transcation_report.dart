import 'package:flutter/material.dart';
import '../../widgets/transcation_re.dart';
import '../../models/transcations.dart';

class TransactionReportScreen extends StatelessWidget {
  TransactionReportScreen({super.key});

  final List<Reports> transactions = [
    Reports(
      title: 'Water Bill',
      amount: -280,
      status: 'Unsuccessfully',
      date: DateTime.now(),
      icon: 'water_drop',
    ),
    Reports(
      title: 'Income: Salary Oct',
      amount: 1200,
      status: '',
      date: DateTime.now().subtract(const Duration(days: 1)),
      icon: 'wallet',
    ),
    // Add more transactions here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Transaction report',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: transactions.length,
        separatorBuilder: (context, index) => const SizedBox(height: 16),
        itemBuilder: (context, index) {
          if (index == 0 || transactions[index].date.day != transactions[index - 1].date.day) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    index == 0 ? 'Today' : 'Yesterday',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey,
                    ),
                  ),
                ),
                TransactionTile(transaction: transactions[index]),
              ],
            );
          }
          return TransactionTile(transaction: transactions[index]);
        },
      ),
    );
  }
}