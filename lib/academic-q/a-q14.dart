import 'dart:async';
import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-predict.dart'; // Import your final results page

class AcademicQuestion14 extends StatefulWidget {
  const AcademicQuestion14({super.key});

  @override
  State<AcademicQuestion14> createState() => _AcademicQuestion14State();
}

class _AcademicQuestion14State extends State<AcademicQuestion14> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _attendanceController = TextEditingController();

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
                  const Text("Please wait...", style: TextStyle(color: Colors.grey)),
                ],
              ),
            );
          },
        );
      },
    );

    // Redirect after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pop(context); // Close dialog
      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const APredictPage()),
                        );
      // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const APredictPage()));
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
        title: const Text("Questionnaire", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("93% Pending ...", style: TextStyle(color: Colors.grey)),
              const SizedBox(height: 10),
              SizedBox(
                height: 12,
                child: LiquidLinearProgressIndicator(
                  value: 0.93,
                  valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                  backgroundColor: const Color(0xFFF0F0F0),
                  direction: Axis.horizontal,
                ),
              ),
              const SizedBox(height: 40),
              const Text(
                "Percentage of scheduled classes\nthe student has attended",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Center(
                child: Image.network(
                  'https://cdn-icons-png.flaticon.com/512/3588/3588658.png', // Attendance clipboard icon
                  height: 200,
                ),
              ),
              const SizedBox(height: 40),
              TextFormField(
                controller: _attendanceController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Attendance Percentage (0-100%)",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Please enter percentage';
                  final n = int.tryParse(value);
                  if (n == null || n < 0 || n > 100) return 'Enter a value between 0-100';
                  return null;
                },
              ),
              const Spacer(),
              SizedBox(
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
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}