import 'package:flutter/material.dart';

class AmountDisplay extends StatelessWidget {
  final double amount;
  final String? subtitle;

  const AmountDisplay({
    Key? key,
    required this.amount,
    this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            letterSpacing: -1,
          ),
        ),
        if (subtitle != null)
          Text(
            subtitle!,
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
      ],
    );
  }
}