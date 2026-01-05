import 'package:flutter/material.dart';

class AppBottomNav extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const AppBottomNav({Key? key, required this.currentIndex, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: currentIndex,
      selectedItemColor: Colors.black,
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: onTap,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.calendar_month_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.school_outlined), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.directions_walk), label: ""),
        BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: ""),
      ],
    );
  }
}
