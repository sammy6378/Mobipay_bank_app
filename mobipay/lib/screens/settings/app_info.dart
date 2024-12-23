import 'package:flutter/material.dart';

class AppInfoScreen extends StatelessWidget {
  const AppInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App Information'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'About Mobipay',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Mobipay is a secure and user-friendly mobile payment solution designed to simplify transactions. With Mobipay, you can withdraw, send, and manage your finances effortlessly.',
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 32),
            const Divider(),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.info_outline, color: Colors.blue),
                SizedBox(width: 16),
                Text(
                  'Version: 1.0.0',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.developer_mode, color: Colors.green),
                SizedBox(width: 16),
                Text(
                  'Developer: Mobipay Solutions Inc.',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.email, color: Colors.red),
                SizedBox(width: 16),
                Text(
                  'Contact: support@mobipay.com',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.phone, color: Colors.teal),
                SizedBox(width: 16),
                Text(
                  'Phone: +1 (123) 456-7890',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            const Spacer(),
            Center(
              child: Text(
                '© 2024 Mobipay Solutions Inc. All rights reserved.',
                style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
