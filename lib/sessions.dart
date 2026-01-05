import 'package:flutter/material.dart';
import 'ecommerce.dart';
import 'academic.dart';
import 'wareable.dart';
import 'time-series.dart';
import 'widgets/app_bottom_nav.dart';

class SessionsPage extends StatelessWidget {
  final String userName;
  const SessionsPage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Top Banner: Schedule a Session
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color(0xFFE8E8E8),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  children: [
                    Image.network('https://cdn-icons-png.flaticon.com/512/3774/3774299.png', height: 80), // Doctor icon
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Schedule a Session", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text("Schedule a session with a professional to lift your mood", 
                            style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),
              _buildSectionHeader("Up Coming"),
              
              // Upcoming Session Card
              Container(
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(25),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Icon(Icons.access_time, size: 40, color: Colors.grey),
                          SizedBox(width: 15),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("25th December 2025", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                              Text("Session ID: S202523   Time: 8.30pm", style: TextStyle(color: Colors.grey, fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Color(0xFFE0E0E0),
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(25), bottomRight: Radius.circular(25)),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Dr. Jagath Perera", style: TextStyle(fontWeight: FontWeight.bold)),
                              Text("Counseling psychologists", style: TextStyle(fontSize: 12, color: Colors.grey[700])),
                              Text("Kindly join 5 minutes in advance", style: TextStyle(fontSize: 10, color: Colors.grey[600])),
                            ],
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                            ),
                            child: Text("Join Now", style: TextStyle(color: Colors.white)),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),

              SizedBox(height: 30),
              _buildSectionHeader("Past Sessions"),
              
              _buildPastSessionCard("1st December 2025", "S202511", "6.30pm", "Dr. Jagath Perera"),
              _buildPastSessionCard("21st November 2025", "S202507", "6.30pm", "Dr. Jagath Perera"),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 1,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => EcommercePage(userName: userName)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AcademicPage(userName: userName)),
            );
          }else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WearablePage(userName: userName)),
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

  Widget _buildSectionHeader(String title) {
    return Row(
      children: [
        Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        SizedBox(width: 8),
        Icon(Icons.arrow_forward_ios, size: 14),
      ],
    );
  }

  Widget _buildPastSessionCard(String date, String id, String time, String doctor) {
    return Container(
      margin: EdgeInsets.only(top: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
          Icon(Icons.access_time, size: 40, color: Colors.grey),
          SizedBox(width: 15),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(date, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
              Text("Session ID: $id   Time: $time", style: TextStyle(color: Colors.grey, fontSize: 12)),
              Text(doctor, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
            ],
          ),
        ],
      ),
    );
  }
}