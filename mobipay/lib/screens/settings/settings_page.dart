import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobipay/screens/home_screen.dart';
import 'package:mobipay/screens/profile/profile_screen.dart';
import 'package:mobipay/screens/settings/app_info.dart';
import 'package:mobipay/screens/settings/change_password.dart';
import 'package:mobipay/screens/settings/language_selection.dart';
import '../../widgets/setting_tile.dart';

class SettingsPage extends StatelessWidget {
   SettingsPage({super.key});

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
          onPressed: () => Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        )
        ,
        ),
        title: const Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child:  Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage("assets/images/html.jpg"),
                ),
                SizedBox(height: 10),
                Text(
                  user?.displayName ?? 'User',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          SettingTile(
            title: 'Password',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ChangePasswordScreen()),
              );
            },
          ),
          SettingTile(
            title: 'Profile',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
            },
          ),
          SettingTile(
            title: 'Languages',
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LanguageSelectionScreen()),
              );
            },
          ),
          SettingTile(
            title: 'App information',
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const AppInfoScreen()));
            },
          ),
          SettingTile(
            title: 'Log Out',
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );
            },
          ),
        ],
      ),
    );
  }
}