import 'package:flutter/material.dart';
import '../models/contact.dart';
import '../widgets/message_tile.dart';

class MessagesPage extends StatelessWidget {
  final List<Message> messages = [
    Message(
      title: 'Bank of America',
      subtitle: 'Bank of America : 256486 is the au...',
      date: 'Today',
      icon: 'bank',
    ),
    Message(
      title: 'Account',
      subtitle: 'Your account is limited. Please foll...',
      date: '12/10',
      icon: 'account',
    ),
    Message(
      title: 'Alert',
      subtitle: 'Your statement is ready for you to...',
      date: '11/10',
      icon: 'alert',
    ),
    Message(
      title: 'Paypal',
      subtitle: 'Your account has been locked. Ple...',
      date: '10/11',
      icon: 'paypal',
    ),
    Message(
      title: 'Withdraw',
      subtitle: 'Dear customer, 2987456 is your co...',
      date: '10/12',
      icon: 'withdraw',
    ),
  ];

  MessagesPage({super.key});

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
          'Message',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ListView.separated(
        padding: const EdgeInsets.all(16),
        itemCount: messages.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => MessageTile(message: messages[index]),
      ),
    );
  }
}