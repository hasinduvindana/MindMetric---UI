import 'package:flutter/material.dart';

class PhysicalPredictPage extends StatelessWidget {
  const PhysicalPredictPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded sample prediction for physical/daily stress
    const String predictionResult = "Low Stress - Balanced Lifestyle";
    const String recommendation = 
        "Great job! Your current physical activity and coping strategies are effectively managing your stress levels. Keep maintaining this routine!";

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Results",
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Prediction Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/healthy-lifestyle-concept-illustration_114360-1437.jpg', // Balanced lifestyle icon
                height: 250,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 40),

            // Prediction Label
            const Text(
              "Your Prediction is :",
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 10),

            // Hardcoded Result Text
            const Text(
              predictionResult,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Green for positive/balanced results
              ),
            ),
            const SizedBox(height: 20),

            // Recommendation Text
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                recommendation,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(),

            // Back to Main Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to the very first screen (Home/Bottom Nav)
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Back to Home",
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
}