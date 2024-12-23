import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/auth_header.dart';
import '../../constants/colors.dart';
import '../../navigation/app_routes.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isTermsAccepted = false;
  bool _isFormValid = false;

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(_validateForm);
    _emailController.addListener(_validateForm);
    _phoneController.addListener(_validateForm);
    _passwordController.addListener(_validateForm);
  }

  void _validateForm() {
    setState(() {
      _isFormValid = _usernameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _isTermsAccepted;
    });
  }

  Future<void> signUp() async {
    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phoneNumber = _phoneController.text.trim();

    // Pre-validation
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid email address.')),
      );
      return;
    }

    if (password.length < 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Password must be at least 6 characters.')),
      );
      return;
    }

    if (!RegExp(r'^\d{10,15}$').hasMatch(phoneNumber)) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid phone number.')),
      );
      return;
    }

    // Firebase sign-up
    try {
       // Create user
    UserCredential userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);

        final user = userCredential.user;
     
       // Update the display name
    await userCredential.user?.updateDisplayName(_usernameController.text.trim());

    // Refresh user data
    // await userCredential.user?.reload();

     // Save additional user data in Firestore
    if (user != null) {
      await FirebaseFirestore.instance.collection('users').doc(user.uid).set({
        'uid': user.uid,
        'fullName': username,
        'email': email,
        'phone': phoneNumber,
        'createdAt': DateTime.now(),
      });
    }

      Navigator.pushReplacementNamed(context, AppRoutes.homePage);
    } on FirebaseAuthException catch (e) {
      String message;

      if (e.code == 'email-already-in-use') {
        message = 'This email is already in use. Please try signing in.';
      } else if (e.code == 'invalid-email') {
        message = 'Invalid email address format.';
      } else if (e.code == 'weak-password') {
        message = 'The password is too weak. Try a stronger password.';
      } else {
        message = 'An error occurred: ${e.message}';
      }

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('An unexpected error occurred: $e')),
      );
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              AuthHeader(
                title: 'Sign up',
                showBackButton: true,
                onBackPressed: () => Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.landing,
                ),
              ),
              const SizedBox(height: 16),
              // Reduced size of the circular avatar
              Center(
                child: Container(
                  width: 80, // Reduced size
                  height: 80, // Reduced size
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.group,
                    size: 40, // Adjusted icon size
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              const Text(
                'Welcome to Mobipay,',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'Hello there, create New account',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 32),
              CustomTextField(
                controller: _usernameController,
                hintText: 'username',
                prefixIcon: Icons.person_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _emailController,
                hintText: 'Email',
                prefixIcon: Icons.mail_outline,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _phoneController,
                hintText: 'Phone Number',
                prefixIcon: Icons.phone_outlined,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                controller: _passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outline,
                isPassword: true,
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Checkbox(
                    value: _isTermsAccepted,
                    onChanged: (value) {
                      setState(() {
                        _isTermsAccepted = value ?? false;
                        _validateForm();
                      });
                    },
                    activeColor: AppColors.primaryColor,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: 'By creating an account you agree to our ',
                        style: const TextStyle(color: Colors.black54),
                        children: [
                          TextSpan(
                            text: 'Terms and Conditions',
                            style: TextStyle(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              CustomButton(
                text: 'Sign up',
                onPressed: _isFormValid ? signUp : null,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account? ',
                    style: TextStyle(color: Colors.black54),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                        context,
                        AppRoutes.signIn,
                      );
                    },
                    child: Text(
                      'Sign In',
                      style: TextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
