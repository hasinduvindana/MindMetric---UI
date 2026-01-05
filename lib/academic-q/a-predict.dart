import 'package:flutter/material.dart';
// import 'academic.dart'; // Import to allow returning to the main academic page

class APredictPage extends StatelessWidget {
  const APredictPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Hardcoded sample prediction for now
    const String predictionResult = "High Stress Level Detected";
    const String recommendation = "Based on your inputs, you may be experiencing academic burnout. We recommend scheduling a session with a counselor.";

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
                'https://img.freepik.com/free-vector/data-extraction-concept-illustration_114360-4766.jpg', // Analysis result illustration
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
            Text(
              predictionResult,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent, // Red to match "Highly Stressed" theme
              ),
            ),
            const SizedBox(height: 20),

            // Recommendation Text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                recommendation,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  height: 1.5,
                ),
              ),
            ),
            const Spacer(),

            // Back to Academic Life Button
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    // Navigate back to the main Academic page
                    Navigator.popUntil(context, (route) => route.isFirst);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Try Again",
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