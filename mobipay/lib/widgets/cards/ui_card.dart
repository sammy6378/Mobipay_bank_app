import 'package:flutter/material.dart';
import 'package:mobipay/widgets/cards/paypal_card.dart';

class CreditCardsPage extends StatelessWidget {
  const CreditCardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .04),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // Title Section
                _buildTitleSection(
                  context: context,
                  title: "Your Cards",
                ),
                const SizedBox(height: 16),

                // Credit Card App Widget
                const CreditCardList(),

                const SizedBox(height: 24),

                // Add Card/Bank Button
                Center(
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // Placeholder for adding card/bank functionality
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    icon: const Icon(Icons.add),
                    label: const Text(
                      "Connect another card/bank",
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Build the title section
  Widget _buildTitleSection(
      {required BuildContext context, required String title}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
