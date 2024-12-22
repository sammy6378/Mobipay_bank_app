import 'package:flutter/material.dart';
import '../widgets/bill_item.dart';

class PayBillsScreen extends StatelessWidget {
  final List<Map<String, dynamic>> bills = [
    {
      'title': 'Water Bill',
      'amount': '280',
      'dueDate': 'Today',
      'icon': Icons.water_drop,
    },
    {
      'title': 'Electric Bill',
      'amount': '480',
      'dueDate': 'Tomorrow',
      'icon': Icons.electric_bolt,
    },
    {
      'title': 'Internet Bill',
      'amount': '100',
      'dueDate': 'Next Week',
      'icon': Icons.wifi,
    },
    {
      'title': 'Phone Bill',
      'amount': '75',
      'dueDate': 'Next Week',
      'icon': Icons.phone_android,
    },
  ];

  PayBillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Pay Bills',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: bills.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final bill = bills[index];
          return BillItem(
            title: bill['title'],
            amount: bill['amount'],
            dueDate: bill['dueDate'],
            icon: bill['icon'],
            onTap: () {
              // Handle bill payment
            },
          );
        },
      ),
    );
  }
}