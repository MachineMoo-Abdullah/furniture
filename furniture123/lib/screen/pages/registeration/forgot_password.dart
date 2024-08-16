import 'package:flutter/material.dart';
import 'package:myapp/services/auth_services.dart'; // Import AuthService

import '../../screen.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ForgotPasswordPageState createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();
  final AuthService _authService =
      AuthService(); // Create instance of AuthService
  bool _isResetEmailSent = false;

  void _sendPasswordResetEmail() async {
    try {
      await _authService.sendPasswordResetEmail(_emailController.text);
      setState(() {
        _isResetEmailSent = true;
      });
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content:
              Text("Password reset email sent to ${_emailController.text}"),
        ),
      );
    } catch (e) {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content:
              Text("Failed to send password reset email. Please try again."),
        ),
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        title: const Text("Forgot Password",
            style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: EdgeInsets.all(size.width * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _emailController,
              decoration: const InputDecoration(
                fillColor: Colors.white,
                labelText: "Enter your Gmail",
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: size.height * 0.02),
            if (_isResetEmailSent)
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    "Password reset email sent!",
                    style: TextStyle(color: Colors.green),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ElevatedButton(
              onPressed: () {
                _sendPasswordResetEmail();
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
              ),
              child: const Text("Send Password Reset Email",
                  style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
