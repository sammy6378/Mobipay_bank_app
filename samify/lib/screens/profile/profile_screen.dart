import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samify/providers/auth_provider.dart';
import 'package:samify/screens/settings/settings_screen.dart';
import 'package:samify/widgets/profile/profile_header.dart';
import 'package:samify/widgets/profile/stats_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            ),
          ),
        ],
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) {
          final user = auth.user;
          if (user == null) return const SizedBox.shrink();

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ProfileHeader(user: user),
              const SizedBox(height: 24),
              StatsSection(userId: user.id),
              const SizedBox(height: 24),
              ListTile(
                leading: const Icon(Icons.logout),
                title: const Text('Sign Out'),
                onTap: () => auth.signOut(),
              ),
            ],
          );
        },
      ),
    );
  }
}