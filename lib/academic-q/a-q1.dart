import 'package:flutter/material.dart';
import 'package:liquid_progress_indicator_v2/liquid_progress_indicator.dart';
import 'a-q2.dart';

class AQ1Page extends StatelessWidget {
  final String userName;

  const AQ1Page({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          "Questionnaire",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Text(
              "0% Pending ...",
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 10),
            
            // Liquid Floating Progress Bar
            SizedBox(
              height: 12,
              width: double.infinity,
              child: LiquidLinearProgressIndicator(
                value: 0.1, // 10% for the first question
                valueColor: const AlwaysStoppedAnimation(Color(0xFF2D3E50)), // Dark blue/grey
                backgroundColor: const Color(0xFFF0F0F0),
                borderColor: Colors.transparent,
                borderWidth: 0,
                direction: Axis.horizontal,
              ),
            ),
            
            const SizedBox(height: 40),
            const Center(
              child: Text(
                "How much caffeine do you take\nin a day?",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  height: 1.3,
                ),
              ),
            ),
            
            const SizedBox(height: 30),
            
            // Question Illustration
            Center(
              child: Container(
                height: 180,
                width: 180,
                decoration: BoxDecoration(
                  color: const Color(0xFFFFEBD8), // Light peach background
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1514432324607-a09d9b4aefdd?w=400',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Answer Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                childAspectRatio: 1.1,
                children: [
                  _buildAnswerBox(context, "Less than 1\nEnergy drinks/\nCoffees"),
                  _buildAnswerBox(context, "Less than 2\nEnergy drinks/\nCoffees"),
                  _buildAnswerBox(context, "Less than 5\nEnergy drinks/\nCoffees"),
                  _buildAnswerBox(context, "More than 5\nEnergy drinks/\nCoffees"),
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
          MaterialPageRoute(builder: (context) => const AcademicQuestion2()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: const Color(0xFFF0F0F0), // Light grey background
          borderRadius: BorderRadius.circular(20),
        ),
        child: Center(
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
