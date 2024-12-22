import 'package:flutter/material.dart';
import '../../widgets/transcation_list.dart';
import '../../models/transcations.dart';


class RecentTransactionsScreen extends StatelessWidget {
  const RecentTransactionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Recent Transactions',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10, // Replace with actual transactions
                itemBuilder: (context, index) {
                  return TransactionListItem(
                    transaction: Transaction(
                      name: 'Netflix',
                      category: 'Entertainment',
                      imageUrl: 'assets/netflix.png',
                      amount: 10.0,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}