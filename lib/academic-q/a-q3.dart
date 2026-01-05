import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-q4.dart'; // Import your next question page here

class AcademicQuestion3 extends StatelessWidget {
  const AcademicQuestion3({super.key});

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
            fontSize: 24
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
              "14% Pending ...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            
            // Liquid Floating Progress Bar at 14%
            SizedBox(
              height: 12,
              width: double.infinity,
              child: LiquidLinearProgressIndicator(
                value: 0.14, 
                valueColor: const AlwaysStoppedAnimation(Color(0xFF2D3E50)),
                backgroundColor: const Color(0xFFF0F0F0),
                borderColor: Colors.transparent,
                borderWidth: 0,
                direction: Axis.horizontal,
              ),
            ),
            
            const SizedBox(height: 40),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                "How noisy is your daily\nenvironment?",
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Environmental Noise Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/noisy-street-concept-illustration_114360-7457.jpg', // Placeholder for traffic/noise illustration
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Answer Grid for Noise Levels
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
                children: [
                  _buildAnswerBox(context, "Very Quiet"),
                  _buildAnswerBox(context, "Low Noise"),
                  _buildAnswerBox(context, "Medium Noise"),
                  _buildAnswerBox(context, "Very Noisy"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAnswerBox(BuildContext context, String text) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AcademicQuestion4()),
        );
        // Handle selection and navigate to the next question (e.g., a-q4.dart)
        // Navigator.push(context, MaterialPageRoute(builder: (context) => const AcademicQuestion4()));
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}