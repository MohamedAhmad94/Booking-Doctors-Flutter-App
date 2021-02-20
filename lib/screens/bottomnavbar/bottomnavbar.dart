import 'package:DoctorsBooking/screens/bottomnavbar/appointments.dart';
import 'package:DoctorsBooking/screens/bottomnavbar/homePage.dart';
import 'package:DoctorsBooking/screens/bottomnavbar/profile.dart';
import 'package:DoctorsBooking/screens/bottomnavbar/browse.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current = 0;
  List screens = [HomePage(), Browse(), Appointments(), Profile()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Browse',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Color(0xff00BBDC),
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: screens[current],
    );
  }
}
