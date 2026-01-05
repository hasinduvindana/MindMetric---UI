import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'p-q7.dart'; // Ensure p-q7.dart is created for navigation

class PhysicalQuestion6 extends StatefulWidget {
  const PhysicalQuestion6({super.key});

  @override
  State<PhysicalQuestion6> createState() => _PhysicalQuestion6State();
}

class _PhysicalQuestion6State extends State<PhysicalQuestion6> {
  String? selectedAnswer;

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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "50% Pending ...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            
            // Liquid Floating Progress Bar set to 50%
            SizedBox(
              height: 12,
              width: double.infinity,
              child: LiquidLinearProgressIndicator(
                value: 0.50, 
                valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                backgroundColor: const Color(0xFF2D3E50).withOpacity(0.1),
                borderColor: Colors.transparent,
                borderWidth: 0,
                direction: Axis.horizontal,
              ),
            ),
            
            const SizedBox(height: 40),
            const Text(
              "Do you work part-time?",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Part-time Work Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/man-working-laptop-concept-illustration_114360-1428.jpg', // Placeholder for working at desk illustration
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 60),
            
            // Yes Answer Box
            _buildSelectionBox("Yes"),
            
            const SizedBox(height: 20),
            
            // No Answer Box
            _buildSelectionBox("No"),

            const Spacer(),

            // Next Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: selectedAnswer == null 
                    ? null 
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const PhysicalQuestion7()),
                        );
                      },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    disabledBackgroundColor: Colors.grey.shade300,
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
    );
  }

  // Helper widget to build the "Yes" or "No" boxes
  Widget _buildSelectionBox(String text) {
    bool isSelected = selectedAnswer == text;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedAnswer = text;
        });
      },
      child: Container(
        width: double.infinity,
        height: 60,
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.shade50 : const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: isSelected ? Colors.blue : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}