import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-q12.dart'; // Ensure a-q12.dart is created in your project

class AcademicQuestion11 extends StatefulWidget {
  const AcademicQuestion11({super.key});

  @override
  State<AcademicQuestion11> createState() => _AcademicQuestion11State();
}

class _AcademicQuestion11State extends State<AcademicQuestion11> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _gpaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Questionnaire",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 10),
              const Text(
                "71% Pending ...",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 10),
              
              // Liquid Floating Progress Bar at 71%
              SizedBox(
                height: 12,
                width: double.infinity,
                child: LiquidLinearProgressIndicator(
                  value: 0.71, 
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                  backgroundColor: const Color(0xFF2D3E50).withOpacity(0.1),
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  direction: Axis.horizontal,
                ),
              ),
              
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "Current Grade Point Average\n(GPA)",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // GPA Illustration
              Center(
                child: Container(
                  height: 220,
                  width: 220,
                  decoration: BoxDecoration(
                    color: const Color(0xFFE0E0E0).withOpacity(0.5),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Image.network(
                      'https://cdn-icons-png.flaticon.com/512/3200/3200760.png', // Placeholder for GPA document icon
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Answer Input Field for GPA (0-4)
              TextFormField(
                controller: _gpaController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  hintText: "Enter GPA (0-4)",
                  hintStyle: const TextStyle(color: Colors.grey),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: const BorderSide(color: Color(0xFFE0E0E0)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your GPA';
                  }
                  final n = double.tryParse(value);
                  if (n == null) {
                    return 'Please enter a valid number';
                  }
                  if (n < 0 || n > 4) {
                    return 'GPA must be between 0 and 4';
                  }
                  return null;
                },
              ),
              
              const Spacer(),
              
              // Next Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AcademicQuestion12()),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
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
}