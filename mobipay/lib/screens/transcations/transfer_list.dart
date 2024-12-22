import 'package:flutter/material.dart';
import 'package:mobipay/screens/transcations/success_screen.dart';


class TransferListScreen extends StatelessWidget {
  const TransferListScreen({super.key});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text('Transfer money to',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: Column(
        children: [
          const CircleAvatar(
            radius: 50,
            backgroundColor: Colors.grey,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(height: 12),
          const Text('Jane Cooper',
              style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          const Text('3246 **** **** 3422',
              style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),
          const Text('\$ 320.00',
              style: TextStyle(
                  fontSize: 32, fontWeight: FontWeight.bold)),
          const Text('No fee', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 24),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey.shade200,
            ),
            child: const Row(
              children: [
                Icon(Icons.credit_card, color: Colors.orange),
                SizedBox(width: 8),
                Text('**** 2236'),
                Spacer(),
                Text('Balance: \$5300.00'),
                Icon(Icons.arrow_drop_down)
              ],
            ),
          ),
          const Spacer(),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 16),
              backgroundColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SuccessScreen(amount: 320.00, recipientName: 'Jane Cooper')));
            },
            child: const Text('Send', style: TextStyle(fontSize: 18)),
          ),
        ],
      ),
    );
  }
}