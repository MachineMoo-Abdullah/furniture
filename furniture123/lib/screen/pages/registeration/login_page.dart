import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import Firebase Auth

import 'package:myapp/screen/pages/registeration/components/components.dart';
import 'package:myapp/screen/pages/registeration/widgets/widgets.dart';
import 'package:myapp/screen/screen.dart'; // Import HomeScreen

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool rememberMe = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double padding = size.width * 0.05; // Adjust padding based on screen size

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const Upside(
                  imgUrl: "assets/images/login_signup/logofurniture.png"),
              const PageTitleBar(title: "Login to your account"),
              Padding(
                padding: EdgeInsets.only(top: size.height * 0.3),
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: padding),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: size.height * 0.02),
                        iconButton(context),
                        SizedBox(height: size.height * 0.03),
                        const Text(
                          "or use your email account",
                          style: TextStyle(
                            color: Colors.grey,
                            fontFamily: 'OpenSans',
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              RoundedInputField(
                                hintText: "Email",
                                icon: Icons.email,
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  return null;
                                },
                              ),
                              RoundedPasswordField(
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  return null;
                                },
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 40),
                                child: SwitchListTile(
                                  dense: true,
                                  title: const Text(
                                    'Remember me',
                                    style: TextStyle(
                                        fontSize: 16, fontFamily: 'OpenSans'),
                                  ),
                                  value: rememberMe,
                                  activeColor: kPrimaryColor,
                                  onChanged: (val) {
                                    setState(() {
                                      rememberMe = val;
                                    });
                                  },
                                ),
                              ),
                              RoundedButton(
                                text: 'LOGIN',
                                press: _loginUser,
                              ),
                              const SizedBox(height: 10),
                              UnderPart(
                                title: "Don't have an account?",
                                navigatorText: "Register here",
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const SignUpScreen(),
                                    ),
                                  );
                                },
                              ),
                              const SizedBox(height: 10),
                              const InkWell(
                                child: Text(
                                  'Forgot password?',
                                  style: TextStyle(
                                    color: kPrimaryColor,
                                    fontFamily: 'OpenSans',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _loginUser() async {
    if (_formKey.currentState!.validate()) {
      try {
        final UserCredential userCredential =
            await _auth.signInWithEmailAndPassword(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );
        // Navigate to HomeScreen after successful login
        Navigator.pushReplacement(
          // ignore: use_build_context_synchronously
          context,
          MaterialPageRoute(builder: (context) => const Bottomnavbar()),
        );
      } on FirebaseAuthException catch (e) {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content: Text('Failed to login email or password is incorrect ')),
        );
      }
    }
  }
}

Widget iconButton(BuildContext context) {
  return const Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      RoundedIcon(imageUrl: "assets/images/login_signup/facebook.png"),
      SizedBox(width: 20),
      RoundedIcon(imageUrl: "assets/images/login_signup/google.jpg"),
      SizedBox(width: 20),
      RoundedIcon(imageUrl: "assets/images/login_signup/twitter.png"),
    ],
  );
}