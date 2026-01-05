import 'dart:async';
import 'package:flutter/material.dart';
import 'ecommerce.dart'; // Import your ecommerce file
import 'signup.dart'; // Import your sign-up file

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  // Validation Logic
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Password cannot be empty';
    if (value.length < 8) return 'Minimum 8 characters required';
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value)) {
      return 'Must include uppercase, lowercase, number, and symbol';
    }
    return null;
  }

  void _handleSignIn() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text.trim();
      final userName = email.contains('@') ? email.split('@').first : email;

      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.check_circle, color: Colors.green, size: 60),
                SizedBox(height: 16),
                Text("Login Successful", style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                LinearProgressIndicator(color: Colors.green),
              ],
            ),
          );
        },
      );

      // Wait 3 seconds then navigate
      Timer(Duration(seconds: 3), () {
        if (!mounted) return;
        Navigator.pop(context); // Close dialog
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => EcommercePage(
              userName: userName.isNotEmpty ? userName : 'User',
            ),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(height: 100),
              Text("Login", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
              SizedBox(height: 60),
              Text("Welcome Back !", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              Text("Please enter your email and password", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),
              
              // Email Field
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  hintText: "email@domain.com",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                ),
                validator: (value) => (value == null || value.isEmpty) ? "Email cannot be empty" : null,
              ),
              SizedBox(height: 16),

              // Password Field
              TextFormField(
                controller: _passwordController,
                obscureText: _obscurePassword,
                decoration: InputDecoration(
                  hintText: "••••••••••••",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  suffixIcon: IconButton(
                    icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility),
                    onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                  ),
                ),
                validator: _validatePassword,
              ),
              SizedBox(height: 24),

              // Sign In Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _handleSignIn,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Sign In", style: TextStyle(color: Colors.white)),
                ),
              ),
              
              SizedBox(height: 20),
              Text("or", style: TextStyle(color: Colors.grey)),
              SizedBox(height: 20),
              Text("If you haven't already sign up", style: TextStyle(color: Colors.grey, fontSize: 12)),
              SizedBox(height: 16),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Color(0xFFEEEEEE),
                    side: BorderSide.none,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Sign Up", style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}