import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'ecommerce.dart';
import 'sessions.dart';
import 'academic.dart';
import 'wareable.dart';
import 'widgets/app_bottom_nav.dart';

class TimeSeriesPage extends StatelessWidget {
  final String userName;

  const TimeSeriesPage({Key? key, required this.userName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Status Cards (Mood and Stress)
              Row(
                children: [
                  Expanded(
                    child: _buildStatusCard(
                      "Mood", "Happy", const Color(0xFF90CAF9), Icons.sentiment_satisfied_alt
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildStatusCard(
                      "Stress", "Low", const Color(0xFFA5D6A7), Icons.sentiment_very_satisfied
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),

              // Heart Beat and Sleep Time Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildMetricInfo("Heart Beat", "86", "BP"),
                  _buildMetricInfo("Sleep Time", "6.5", "hrs"),
                ],
              ),
              const SizedBox(height: 30),

              // Sleep Records Line Chart Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.nightlight_round, size: 20),
                      SizedBox(width: 10),
                      Text("Sleep records", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  _buildDropdown("April"),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(height: 100, child: _buildLineChart()),
              const SizedBox(height: 40),

              // Screen Time Bar Chart Section
              const Text("Activity", style: TextStyle(color: Colors.grey, fontSize: 14)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Screen Time", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                  _buildDropdown("Weekly"),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(height: 200, child: _buildBarChart()),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: AppBottomNav(
        currentIndex: 4,
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
          } else if (index == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => WearablePage(userName: userName)),
            );
          }
        },
      ),
    );
  }

  // Helper for Top Mood/Stress Cards
  Widget _buildStatusCard(String title, String status, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 16)),
              Icon(icon, color: Colors.black, size: 20),
            ],
          ),
          const SizedBox(height: 10),
          Center(
            child: Text(
              status,
              style: const TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }

  // Helper for Heart Beat and Sleep Time text
  Widget _buildMetricInfo(String label, String value, String unit) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        const SizedBox(height: 5),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(value, style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5),
            Text(unit, style: const TextStyle(fontSize: 16, color: Colors.black54)),
          ],
        ),
      ],
    );
  }

  // Helper for Dropdowns
  Widget _buildDropdown(String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
          const Icon(Icons.arrow_drop_down, color: Colors.white, size: 18),
        ],
      ),
    );
  }

  // Sleep Records Line Chart
  Widget _buildLineChart() {
    return LineChart(
      LineChartData(
        gridData: FlGridData(show: false),
        titlesData: FlTitlesData(show: false),
        borderData: FlBorderData(show: false),
        lineBarsData: [
          LineChartBarData(
            spots: [
              const FlSpot(0, 1), const FlSpot(1, 1.5), const FlSpot(2, 1),
              const FlSpot(3, 3), const FlSpot(4, 1.2), const FlSpot(5, 2.5),
              const FlSpot(6, 1), const FlSpot(7, 2.2), const FlSpot(8, 1.5),
            ],
            isCurved: true,
            color: Colors.blueAccent,
            barWidth: 2,
            dotData: FlDotData(show: false),
          ),
        ],
      ),
    );
  }

  // Screen Time Bar Chart
  Widget _buildBarChart() {
    return BarChart(
      BarChartData(
        alignment: BarChartAlignment.spaceAround,
        maxY: 3000,
        barTouchData: BarTouchData(enabled: false),
        titlesData: FlTitlesData(show: false),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: [
          _makeBarGroup(0, 1500),
          _makeBarGroup(1, 1000),
          _makeBarGroup(2, 1800),
          _makeBarGroup(3, 1200),
          _makeBarGroup(4, 2300, isHighlighted: true),
          _makeBarGroup(5, 900),
          _makeBarGroup(6, 1600),
        ],
      ),
    );
  }

  BarChartGroupData _makeBarGroup(int x, double y, {bool isHighlighted = false}) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: y,
          color: isHighlighted ? Colors.purpleAccent : Colors.purple.withOpacity(0.1),
          width: 25,
          borderRadius: BorderRadius.circular(6),
        ),
      ],
    );
  }
}