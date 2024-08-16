import 'package:flutter/material.dart';

class AdminLoginPage extends StatelessWidget {
  const AdminLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: size.width * 0.1),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.1), // 10% of screen height
              _buildLogo(),
              SizedBox(height: size.height * 0.05), // 5% of screen height
              _buildTitle(),
              SizedBox(height: size.height * 0.05), // 5% of screen height
              _buildEmailField(),
              SizedBox(height: size.height * 0.02), // Space between fields
              _buildPasswordField(),
              SizedBox(height: size.height * 0.05), // 5% of screen height
              _buildLoginButton(context),
              SizedBox(height: size.height * 0.02), // Space after button
              _buildForgotPassword(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLogo() {
    return const CircleAvatar(
      radius: 60.0,
      backgroundColor: Colors.transparent,
      backgroundImage: AssetImage('assets/images/login_signup/login2.png'), // Replace with your logo asset
    );
  }

  Widget _buildTitle() {
    return const Text(
      "Admin Login",
      style: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.black,
      ),
    );
  }

  Widget _buildEmailField() {
    return TextField(
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: const Icon(Icons.email),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildPasswordField() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        prefixIcon: const Icon(Icons.lock),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50.0,
      child: ElevatedButton(
        onPressed: () {
          // Handle login logic here
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
        child: const Text(
          "Login",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return GestureDetector(
      onTap: () {
        // Handle forgot password logic here
      },
      child: const Text(
        "Forgot Password?",
        style: TextStyle(
          color: Colors.blue,
          fontSize: 16,
        ),
      ),
    );
  }
}
