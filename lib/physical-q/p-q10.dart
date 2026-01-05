import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'p-predict.dart'; // Ensure p-predict.dart is created in your project

class PhysicalQuestion10 extends StatefulWidget {
  const PhysicalQuestion10({super.key});

  @override
  State<PhysicalQuestion10> createState() => _PhysicalQuestion10State();
}

class _PhysicalQuestion10State extends State<PhysicalQuestion10> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _hoursController = TextEditingController();

  void _showAnalysingDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Analysing",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 30),
                  // Liquid Circular Progress Animation
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: TweenAnimationBuilder<double>(
                      tween: Tween(begin: 0.0, end: 1.0),
                      duration: const Duration(seconds: 3),
                      builder: (context, value, child) {
                        return LiquidCircularProgressIndicator(
                          value: value,
                          valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                          backgroundColor: Colors.white,
                          borderColor: Colors.blue.shade800,
                          borderWidth: 2.0,
                          direction: Axis.vertical,
                          center: Text(
                            "${(value * 100).toInt()}%",
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text("Processing your data...", style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          },
        );
      },
    );

    // Redirect to p-predict.dart after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context); // Close dialog
      Navigator.pushReplacement(
        context, 
        MaterialPageRoute(builder: (context) => const PhysicalPredictPage())
      );
    });
  }

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
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
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
              const Text("90% Pending ...", style: TextStyle(color: Colors.grey, fontSize: 14)),
              const SizedBox(height: 10),
              // Liquid Linear Progress Bar at 90%
              SizedBox(
                height: 12,
                width: double.infinity,
                child: LiquidLinearProgressIndicator(
                  value: 0.90,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                  backgroundColor: const Color(0xFF2D3E50).withOpacity(0.1),
                  direction: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 40),
              const Center(
                child: Text(
                  "How many hours per week do\nyou work at a job?",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, height: 1.3),
                ),
              ),
              const SizedBox(height: 30),
              // Work Illustration
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/man-working-laptop-concept-illustration_114360-1428.jpg',
                  height: 220,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(height: 40),
              const Text("Button", style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 10),
              // Answer Input Field
              TextFormField(
                controller: _hoursController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Hours",
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter hours';
                  return null;
                },
              ),
              const Spacer(),
              const Text("Button", style: TextStyle(color: Colors.grey, fontSize: 16)),
              const SizedBox(height: 10),
              // Finish Button
              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _showAnalysingDialog();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    child: const Text("Finish", style: TextStyle(color: Colors.white, fontSize: 18)),
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