import 'package:flutter/material.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  // Controllers for the fields
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _dobController = TextEditingController();

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
        title: Text("Sign Up", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Text("Create a new account", 
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              Text("Please enter your details to sign up", 
                style: TextStyle(color: Colors.grey)),
              SizedBox(height: 30),

              _buildTextField("Full Name", _nameController),
              _buildTextField("Email", _emailController),
              
              // Password Field with Toggle
              _buildPasswordField("Password", _obscurePassword, () {
                setState(() => _obscurePassword = !_obscurePassword);
              }),

              // Confirm Password Field with Toggle
              _buildPasswordField("Confirm Password", _obscureConfirmPassword, () {
                setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
              }),

              _buildTextField("Mobile Number", _phoneController),
              _buildTextField("Gender", null),
              
              // Date of Birth Field with Calendar Icon
              TextFormField(
                controller: _dobController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "Date of Birth (day/month/year)",
                  suffixIcon: Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                ),
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      _dobController.text = "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
                    });
                  }
                },
              ),

              SizedBox(height: 30),
              
              // Terms and Conditions Text
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      children: [
                        TextSpan(text: "By clicking sign up, you agree to our "),
                        TextSpan(text: "Terms of Service", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.underline)),
                        TextSpan(text: " and "),
                        TextSpan(text: "Privacy Policy", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 20),

              // Sign Up Button
              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Handle signup logic
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 16)),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  // Helper widget for standard text fields
  Widget _buildTextField(String hint, TextEditingController? controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        ),
      ),
    );
  }

  // Helper widget for password fields
  Widget _buildPasswordField(String hint, bool obscure, VoidCallback onToggle) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          suffixIcon: IconButton(
            icon: Icon(obscure ? Icons.toggle_off : Icons.toggle_on, color: Colors.grey, size: 30),
            onPressed: onToggle,
          ),
        ),
      ),
    );
  }
}