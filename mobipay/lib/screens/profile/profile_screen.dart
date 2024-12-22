import 'package:flutter/material.dart';
import 'package:mobipay/screens/messages.dart';
import 'profile_card.dart';
import 'profile_btn.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
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
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/html.jpg"),
                      ),
                    ),
                    SizedBox(height: 16),
                    Text(
                      'Samuel Mwangi',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'samuelmwangi@gmail.com',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              
              // Statistics
              Row(
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
              SizedBox(height: 32),
              
              // Actions
              Column(
                children: [
                  ProfileActionButton(
                    icon: Icons.account_balance_wallet,
                    label: 'Payment Methods',
                    color: Colors.blue,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
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
                  SizedBox(height: 16),
                  ProfileActionButton(
                    icon: Icons.security,
                    label: 'Security',
                    color: Colors.green,
                    onTap: () {},
                  ),
                  SizedBox(height: 16),
                  ProfileActionButton(
                    icon: Icons.help,
                    label: 'Help Center',
                    color: Colors.purple,
                    onTap: () {},
                  ),
                ],
              ),
              
              SizedBox(height: 32),
              TextButton(
                onPressed: () {},
                child: Text(
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