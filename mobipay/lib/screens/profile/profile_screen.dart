import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobipay/screens/messages.dart';
import 'profile_card.dart';
import 'profile_btn.dart';


class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final user = FirebaseAuth.instance.currentUser;

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
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // Profile Header
              Center(
                child: Column(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                      child: const CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/html.jpg"),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      user?.displayName ?? 'User',
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      user?.email ?? '',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // Statistics
              const Row(
                children: [
                  Expanded(
                    child: ProfileStatCard(
                      label: 'Balance',
                      value: '\$2,454',
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ProfileStatCard(
                      label: 'Transaction',
                      value: '36',
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    child: ProfileStatCard(
                      label: 'Cards',
                      value: '2',
                      color: Colors.purple,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),

              // Actions
              Column(
                children: [
                  ProfileActionButton(
                    icon: Icons.account_balance_wallet,
                    label: 'Payment Methods',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  ProfileActionButton(
                    icon: Icons.notifications,
                    label: 'Notifications',
                    color: Colors.orange,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MessagesPage()),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  ProfileActionButton(
                    icon: Icons.security,
                    label: 'Security',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  const SizedBox(height: 16),
                  ProfileActionButton(
                    icon: Icons.help,
                    label: 'Help Center',
                    color: Colors.purple,
                    onTap: () {},
                  ),
                ],
              ),

              const SizedBox(height: 32),
              TextButton(
                onPressed: () async {
                    try {
                      // Sign out the user
                      await FirebaseAuth.instance.signOut();

                      // Navigate back to the login
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        '/sign-in', 
                        (route) => false,
                      );
                    } catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error signing out: $e')),
                      );
                    }
                  },
                  child: const Text(
                  'Log Out',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
