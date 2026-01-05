import 'package:flutter/material.dart';
import 'academic-q/a-q1.dart'; // Ensure this file exists for navigation
import 'ecommerce.dart';
import 'sessions.dart';
import 'time-series.dart';
import 'wareable.dart';
import 'widgets/app_bottom_nav.dart';

class AcademicPage extends StatefulWidget {
  final String userName;
  const AcademicPage({Key? key, required this.userName}) : super(key: key);

  @override
  State<AcademicPage> createState() => _AcademicPageState();
}

class _AcademicPageState extends State<AcademicPage> {
  // Boolean to toggle between the initial state and the "Stressed" result state
  bool _showResult = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Academic Life",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Section: Changes based on _showResult state
            if (!_showResult) ...[
              // Initial View: Illustration and Description
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/meditation-concept-illustration_114360-1425.jpg', 
                  height: 250,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Academic stress management is about finding healthy ways to balance your workload, maintain focus, and protect your well-being. It involves planning your tasks early, breaking big assignments into smaller steps, and setting realistic goals. Good habits like taking short breaks, staying organized, getting enough sleep, and talking to someone when you feel overwhelmed can make a big difference.",
                textAlign: TextAlign.justify,
                style: TextStyle(color: Colors.grey, height: 1.5, fontSize: 14),
              ),
              const SizedBox(height: 20),
              const Text(
                "Try the quest to check you's",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ] else ...[
              // Result View: Stressed Illustration and Result Text
              Center(
                child: Column(
                  children: [
                    Image.network(
                      'https://img.freepik.com/free-vector/stressed-man-working-laptop_23-2148496469.jpg', 
                      height: 200,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Your are Highly stressed.",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Try the quest again",
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ],
            
            const SizedBox(height: 15),

            // The Academic Stress Quest Card
            GestureDetector(
              onTap: () {
                // Navigate to the Questionnaire
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AQ1Page(userName: widget.userName)),
                );
                // For demonstration: toggle state to show result UI when returning
                setState(() {
                  _showResult = true;
                });
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // Icon placeholder mimicking the clipboard illustration
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: const Icon(Icons.assignment_turned_in, size: 50, color: Colors.blueGrey),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Academic Stress Quest",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Check your work life balance to check your daily stress.",
                            style: TextStyle(color: Colors.grey, fontSize: 13),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Bottom Section: Only shows in Result View
            if (_showResult) ...[
              const SizedBox(height: 30),
              const Center(
                child: Text(
                  "What is Work life balance",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Image.network(
                  'https://img.freepik.com/free-vector/meditation-concept-illustration_114360-1425.jpg',
                  height: 250,
                ),
              ),
            ],
            const SizedBox(height: 20),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 2,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => EcommercePage(userName: widget.userName)),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SessionsPage(userName: widget.userName)),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WearablePage(userName: widget.userName)),
            );
          }else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TimeSeriesPage(userName: widget.userName)),
            );
          }
        },
      ),
    );
  }
}