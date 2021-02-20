import 'package:DoctorsBooking/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CustomAppBar(
              170,
              "",
              Container(
                margin: EdgeInsets.all(10.0),
                child: ListTile(
                  leading: CircleAvatar(
                    minRadius: 40.0,
                    maxRadius: 40.0,
                    backgroundImage:
                        NetworkImage('https://freesvg.org/img/cliente.png'),
                  ),
                  title: Text(
                    "Faizal Ahmed",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    "View Profile",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              'Profile',
            ),
            menuItem("Home", Icons.home),
            menuItem("My Appointments", Icons.calendar_today),
            menuItem(
                "My Medicine Delivery Orders", Icons.medical_services_sharp),
            menuItem("Favorites", Icons.favorite_border_sharp),
            menuItem("Payment Detailes", Icons.payment_sharp),
            menuItem("Logout", Icons.logout),
          ],
        ),
      ),
    );
  }

  menuItem(String iconName, IconData iconData) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTile(
        leading: Icon(iconData, color: Colors.black87, size: 25),
        title: Text(iconName,
            style: TextStyle(
                color: Colors.black87,
                fontSize: 15,
                fontWeight: FontWeight.bold)),
        trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 20.0),
      ),
    );
  }
}
