import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'sessions.dart';
import 'academic.dart';
import 'time-series.dart';
import 'wareable.dart';
import 'widgets/app_bottom_nav.dart';

class EcommercePage extends StatelessWidget {
  final String userName;

  // Pass the name extracted from the email here
  EcommercePage({required this.userName});

  @override
  Widget build(BuildContext context) {
    final String currentDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
    final int hour = DateTime.now().hour;
    final String greeting = hour < 12
        ? 'Good Morning'
        : hour < 17
            ? 'Good Afternoon'
            : 'Good Evening';
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              // Header Banner
              Container(
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage('https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&q=80&w=1000'), // Placeholder for sunset
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(currentDate, style: TextStyle(color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.bold)),
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          "$greeting\n$userName", // Dynamic Greeting and Name
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: const Color.fromARGB(255, 255, 255, 255)),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              
              SizedBox(height: 20),

              // Status Cards Row
              Row(
                children: [
                  Expanded(child: _buildStatusCard("You are in a Happy\nMood", Icons.sentiment_very_satisfied, Colors.yellow)),
                  SizedBox(width: 15),
                  Expanded(child: _buildStatusCard("Sessions Pending", null, null, count: "1", subtitle: "Remaining sessions in this month")),
                ],
              ),

              SizedBox(height: 30),
              Text("Try following actives to lift your mood", style: TextStyle(fontWeight: FontWeight.bold)),
              
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Activities", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  Icon(Icons.arrow_forward_ios, size: 16),
                ],
              ),

              SizedBox(height: 15),
              // Horizontal Activities List
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildActivityItem("Reed a book", "30mins - 2hrs", "https://cdn-icons-png.flaticon.com/512/3389/3389081.png"),
                    SizedBox(width: 20),
                    _buildActivityItem("Play a game", "1hr - 2hrs", "https://cdn-icons-png.flaticon.com/512/3408/3408506.png"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: AppBottomNav(
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => SessionsPage(userName: userName)),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => AcademicPage(userName: userName)),
            );
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WearablePage(userName: userName)),
            );
          }else if (index == 4) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => TimeSeriesPage(userName: userName)),
            );
          }
        },
      ),
    );
  }

  Widget _buildStatusCard(String title, IconData? icon, Color? iconColor, {String? count, String? subtitle}) {
    return Container(
      padding: EdgeInsets.all(16),
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          Spacer(),
          Center(
            child: count != null 
              ? Column(
                  children: [
                    Text(count, style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    if (subtitle != null) Text(subtitle, style: TextStyle(fontSize: 10, color: Colors.grey), textAlign: TextAlign.center),
                  ],
                )
              : Icon(icon, size: 60, color: iconColor),
          ),
          Spacer(),
        ],
      ),
    );
  }

  Widget _buildActivityItem(String title, String time, String imageUrl) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 150,
          height: 150,
          decoration: BoxDecoration(
            color: Colors.grey.shade50,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Center(child: Image.network(imageUrl, height: 100)),
        ),
        SizedBox(height: 8),
        Text(time, style: TextStyle(color: Colors.grey, fontSize: 12)),
        Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}