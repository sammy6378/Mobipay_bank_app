import 'package:flutter/material.dart';
import '../models/transcations.dart';

class TransactionTile extends StatelessWidget {
  final Reports transaction;

  const TransactionTile({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.blue.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          Icons.water_drop,
          color: Colors.blue,
        ),
      ),
      title: Text(
        transaction.title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(
        transaction.status,
        style: const TextStyle(
          color: Colors.grey,
          fontSize: 14,
        ),
      ),
      trailing: Text(
        '${transaction.amount < 0 ? "-" : "+"} \$${transaction.amount.abs()}',
        style: TextStyle(
          color: transaction.amount < 0 ? Colors.red : Colors.green,
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}