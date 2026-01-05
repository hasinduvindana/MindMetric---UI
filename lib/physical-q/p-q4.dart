import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'p-q5.dart'; // Ensure p-q5.dart is created for navigation

class PhysicalQuestion4 extends StatefulWidget {
  const PhysicalQuestion4({super.key});

  @override
  State<PhysicalQuestion4> createState() => _PhysicalQuestion4State();
}

class _PhysicalQuestion4State extends State<PhysicalQuestion4> {
  String? selectedAnswer;

  // Options based on the UI: Never, Sometimes, Often, Always
  final List<String> options = [
    "Never",
    "Sometimes",
    "Often",
    "Always"
  ];

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
              "30% Pending ...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            
            // Liquid Floating Progress Bar set to 30%
            SizedBox(
              height: 12,
              width: double.infinity,
              child: LiquidLinearProgressIndicator(
                value: 0.30, 
                valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                backgroundColor: const Color(0xFF2D3E50).withOpacity(0.1),
                borderColor: Colors.transparent,
                borderWidth: 0,
                direction: Axis.horizontal,
              ),
            ),
            
            const SizedBox(height: 40),
            const Text(
              "When stressed, how often do you\ntry to manage your emotions?",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Emotion Management Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/emotional-intelligence-concept-illustration_114360-6022.jpg', // Placeholder for emotion/magnifying glass illustration
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Answer Selection Grid (4 Boxes)
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  childAspectRatio: 1.2,
                ),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  bool isSelected = selectedAnswer == options[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedAnswer = options[index];
                      });
                    },
                    child: Container(
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
                          options[index],
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isSelected ? Colors.blue : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

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
                          MaterialPageRoute(builder: (context) => const PhysicalQuestion5()),
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
}