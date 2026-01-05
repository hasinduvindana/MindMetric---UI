import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-q3.dart'; // Import your next page here

class AcademicQuestion2 extends StatefulWidget {
  const AcademicQuestion2({super.key});

  @override
  State<AcademicQuestion2> createState() => _AcademicQuestion2State();
}

class _AcademicQuestion2State extends State<AcademicQuestion2> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _answerController = TextEditingController();

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
                "7% Pending ...",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 10),
              
              // Liquid Floating Progress Bar
              SizedBox(
                height: 12,
                width: double.infinity,
                child: LiquidLinearProgressIndicator(
                  value: 0.2, // Progress increment for Q2
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF2D3E50)),
                  backgroundColor: const Color(0xFFF0F0F0),
                  borderColor: Colors.transparent,
                  borderWidth: 0,
                  direction: Axis.horizontal,
                ),
              ),
              
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "On a scale of 1-10, how\nstressed do you usually feel?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Stress Illustration
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/stress-concept-illustration_114360-1123.jpg', // Placeholder for stressed woman
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 40),
              
              // Answer Input Field
              TextFormField(
                controller: _answerController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter (1-10)",
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
                    return 'Please enter a value';
                  }
                  final n = num.tryParse(value);
                  if (n == null || n < 1 || n > 10) {
                    return 'Please enter a number between 1 and 10';
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
                          MaterialPageRoute(builder: (context) => const AcademicQuestion3()),
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