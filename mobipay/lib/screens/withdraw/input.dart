import 'package:flutter/material.dart';

class AmountInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String currency;

  const AmountInput({
    super.key,
    required this.controller,
    required this.label,
    this.currency = '\$',
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey[600],
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            decoration: InputDecoration(
              border: InputBorder.none,
              prefixText: currency,
              prefixStyle: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}