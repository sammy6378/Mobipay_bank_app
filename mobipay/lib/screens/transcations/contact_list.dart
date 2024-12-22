import 'package:flutter/material.dart';
import 'package:mobipay/screens/transcations/transfer_cash.dart';

class ContactSelectionScreen extends StatelessWidget {
  const ContactSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final contacts = [
      {'name': 'Jane Cooper', 'image': 'assets/images/1.jpg'},
      {'name': 'Wade Warren', 'image': 'assets/images/1.jpg'},
      {'name': 'Esther Howard', 'image': 'assets/images/1.jpg'},
      {'name': 'Cameron Williamson', 'image': 'assets/images/1.jpg'},
      // Add more contacts as needed
    ];

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Transfer money to",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                decoration: InputDecoration(
                  hintText: "Write name, phone, or card number",
                  prefixIcon: const Icon(Icons.search),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: contacts.length,
                  itemBuilder: (context, index) {
                    final contact = contacts[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(contact['image']!),
                      ),
                      title: Text(contact['name']!),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                TransferAmountScreen(
                                  recipientName: contact['name']!,
                                  accountNumber: '1234567890', // Replace with actual account number if available
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
