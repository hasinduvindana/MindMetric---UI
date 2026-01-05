import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'p-q2.dart'; // Ensure p-q2.dart is created for navigation

class PhysicalQuestion1 extends StatefulWidget {
  final String userName;

  const PhysicalQuestion1({Key? key, required this.userName}) : super(key: key);

  @override
  State<PhysicalQuestion1> createState() => _PhysicalQuestion1State();
}

class _PhysicalQuestion1State extends State<PhysicalQuestion1> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _minutesController = TextEditingController();

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
                "0% Pending ...",
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
              const SizedBox(height: 10),
              
              // Liquid Floating Progress Bar at 0%
              SizedBox(
                height: 12,
                width: double.infinity,
                child: LiquidLinearProgressIndicator(
                  value: 0.01, // Minimal value to show the wave at start
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
                  "How many minutes per week do\nyou usually exercise?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    height: 1.3,
                  ),
                ),
              ),
              
              const SizedBox(height: 30),
              
              // Exercise Illustration
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/people-doing-physical-activities-set_23-2148560374.jpg', // Placeholder for the exercise couple illustration
                  height: 200,
                  fit: BoxFit.contain,
                ),
              ),
              
              const SizedBox(height: 40),
              
              const Text(
                "Field",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 10),
              
              // Answer Input Field for minutes
              TextFormField(
                controller: _minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "Enter Minutes",
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
                    return 'Please enter the number of minutes';
                  }
                  final n = int.tryParse(value);
                  if (n == null) {
                    return 'Please enter a valid whole number';
                  }
                  return null;
                },
              ),
              
              const Spacer(),
              
              const Text(
                "Button",
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              const SizedBox(height: 10),
              
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
                          MaterialPageRoute(builder: (context) => const PhysicalQuestion2()),
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