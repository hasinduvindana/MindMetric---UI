import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-q8.dart'; // Ensure a-q8.dart is created in your lib folder

class AcademicQuestion7 extends StatefulWidget {
  const AcademicQuestion7({super.key});

  @override
  State<AcademicQuestion7> createState() => _AcademicQuestion7State();
}

class _AcademicQuestion7State extends State<AcademicQuestion7> {
  String? selectedAnswer;

  final List<String> options = [
    "Rarely or not at all",
    "Occasionally",
    "Frequently",
    "Almost\nconstantly"
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
              "42% Pending ...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            
            // Liquid Floating Progress Bar set to 42%
            SizedBox(
              height: 12,
              width: double.infinity,
              child: LiquidLinearProgressIndicator(
                value: 0.42, 
                valueColor: const AlwaysStoppedAnimation(Color(0xFF2196F3)),
                backgroundColor: const Color(0xFF2D3E50).withOpacity(0.1),
                borderColor: Colors.transparent,
                borderWidth: 0,
                direction: Axis.horizontal,
              ),
            ),
            
            const SizedBox(height: 40),
            const Text(
              "Over the past week, how often\nhave you felt anxious, nervous, or\non edge?",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                height: 1.3,
              ),
            ),
            
            const SizedBox(height: 20),
            
            // Anxiety Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/anxiety-concept-illustration_114360-8023.jpg', // Placeholder for anxiety illustration
                height: 180,
                fit: BoxFit.contain,
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Answer Grid (4 Boxes)
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
                            fontSize: 15,
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
                    ? null // Disable button if no answer selected
                    : () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const AcademicQuestion8()),
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