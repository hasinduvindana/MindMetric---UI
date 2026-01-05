import 'package:flutter/material.dart';
import 'physical-q/p-q1.dart'; // Navigation to the first physical question
import 'ecommerce.dart';
import 'sessions.dart';
import 'time-series.dart';
import 'academic.dart';
import 'widgets/app_bottom_nav.dart';

class WearablePage extends StatelessWidget {
  final String userName;

  const WearablePage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Physical Activities",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top Exercise Illustration
            Center(
              child: Image.network(
                'https://img.freepik.com/free-vector/active-people-doing-different-sports_23-2148419639.jpg', 
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 20),

            // Paragraph Text regarding activity and stress
            const Text(
              "Physical activity has a strong positive impact on stress and mood because it helps regulate key factors that influence overall well-being. Regular exercise improves sleep quality, stabilizes heart rate, and reduces the physical tension caused by stress. It can also help offset the negative effects of long screen time, high caffeine intake, and an unhealthy BMI by boosting energy levels and improving hormonal balance. Even simple activities like walking, stretching, or playing a sport can release endorphins, lower anxiety, and make you feel more relaxed and mentally refreshed.",
              textAlign: TextAlign.justify,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14,
                height: 1.5,
              ),
            ),
            const SizedBox(height: 25),

            // Instructional Label
            const Text(
              "Add your daily routine",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 15),

            // Daily Stress Quest Interactive Card
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhysicalQuestion1(userName: userName)),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xFFEEEEEE), // Light grey background
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    // Clipboard Icon Illustration
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.assignment_turned_in_outlined, 
                        size: 50, 
                        color: Color(0xFF546E7A)
                      ),
                    ),
                    const SizedBox(width: 15),
                    const Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Daily Stress Quest",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Check your work life balance to check your daily stress.",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 3,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => EcommercePage(userName: userName)),
            );
          } else if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SessionsPage(userName: userName)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AcademicPage(userName: userName)),
            );
          } else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TimeSeriesPage(userName: userName)),
            );
          }
        },
      ),
    );
  }
}