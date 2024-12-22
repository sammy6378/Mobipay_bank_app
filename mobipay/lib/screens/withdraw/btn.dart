import 'package:flutter/material.dart';

class QuickAmountButton extends StatelessWidget {
  final String amount;
  final VoidCallback onTap;
  final bool isSelected;

  const QuickAmountButton({
    super.key,
    required this.amount,
    required this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          '\$$amount',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}