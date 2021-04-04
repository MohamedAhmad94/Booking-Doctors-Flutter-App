import 'package:doctors_booking/models/mainmodel.dart';
import 'package:doctors_booking/screens/bottomnavbar/appointments.dart';
import 'package:doctors_booking/screens/bottomnavbar/homePage.dart';
import 'package:doctors_booking/screens/bottomnavbar/profile.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class BottomNavBar extends StatefulWidget {
  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int current = 0;
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
            icon: Icon(Icons.calendar_today),
            label: 'Appointments',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profile',
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        currentIndex: current,
        onTap: (index) {
          setState(() {
            current = index;
          });
        },
      ),
      body: ScopedModelDescendant(builder: (context, child, MainModel model) {
        if (current == 0) {
          return HomePage(model);
        } else if (current == 1) {
          return Appointments();
        } else {
          return Profile();
        }
      }),
    );
  }
}
