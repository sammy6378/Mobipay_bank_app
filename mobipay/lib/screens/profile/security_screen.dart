import 'package:flutter/material.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Security Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Enhance Your Security',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildSecurityOption(
              context,
              'Change PIN',
              'Update your secure PIN for transactions.',
              Icons.lock_outline,
            ),
            _buildSecurityOption(
              context,
              'Biometric Authentication',
              'Enable fingerprint or face recognition.',
              Icons.fingerprint,
            ),
            _buildSecurityOption(
              context,
              'Two-Factor Authentication',
              'Add an extra layer of security.',
              Icons.verified_user_outlined,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption(
      BuildContext context, String title, String subtitle, IconData icon) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: const EdgeInsets.only(bottom: 16.0),
      child: ListTile(
        leading: Icon(icon, size: 40, color: Colors.red),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () {
          // Handle tap on security option
        },
      ),
    );
  }
}
