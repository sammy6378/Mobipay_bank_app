// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CreditCardList extends StatelessWidget {
  const CreditCardList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CreditCard(
          backgroundGradient: [
            Color(0xFF003087),
            Color(0xFF0070BA),
          ],
          logoText: 'PayPal',
          cardNumber: '**** **** **** 1234',
          cardHolder: 'John Doe',
          expiryDate: '12/24',
        ),
        SizedBox(height: 20),
        CreditCard(
          backgroundGradient: [
            Color(0xFF0D324D),
            Color(0xFF7F5A83),
          ],
          logoText: 'Bank Inc.',
          cardNumber: '**** **** **** 5678',
          cardHolder: 'Jane Smith',
          expiryDate: '11/25',
        ),
      ],
    );
  }
}


class CreditCard extends StatelessWidget {
  final List<Color> backgroundGradient;
  final String logoText;
  final String cardNumber;
  final String cardHolder;
  final String expiryDate;

  const CreditCard({super.key, 
    required this.backgroundGradient,
    required this.logoText,
    required this.cardNumber,
    required this.cardHolder,
    required this.expiryDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          colors: backgroundGradient,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  logoText,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Icon(
                  Icons.credit_card,
                  color: Colors.white,
                  size: 32,
                ),
              ],
            ),
            Spacer(),
            Text(
              cardNumber,
              style: TextStyle(
                color: Colors.white,
                fontSize: 22,
                letterSpacing: 2,
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'CARD HOLDER',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      cardHolder,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'EXPIRY',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      expiryDate,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}