import 'package:flutter/material.dart';

class RecipientHeader extends StatelessWidget {
  final String name;
  final String accountNumber;
  final String? avatarUrl;

  const RecipientHeader({
    Key? key,
    required this.name,
    required this.accountNumber,
    this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundColor: Colors.blue.withOpacity(0.1),
          backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
          child: avatarUrl == null
              ? Icon(Icons.person, size: 45, color: Colors.blue)
              : null,
        ),
        const SizedBox(height: 16),
        Text(
          name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          accountNumber,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            letterSpacing: 1.2,
          ),
        ),
      ],
    );
  }
}