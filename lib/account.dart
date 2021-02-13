import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 200,
              width: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff00BBDC),
                    Color(0xff03CBC8),
                  ],
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.close, color: Colors.white, size: 35),
                  clientData(
                      "Faizal Ahmed", 'https://freesvg.org/img/cliente.png'),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    menuItem("Home", Icons.home),
                    menuItem("My Appointments", Icons.calendar_today),
                    menuItem("My Medicine Delivery Orders",
                        Icons.medical_services_sharp),
                    menuItem("Favorites", Icons.favorite_border_sharp),
                    menuItem("Payment Detailes", Icons.payment_sharp),
                    menuItem("Logout", Icons.logout),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  menuItem(String iconName, IconData iconData) {
    return ListTile(
      leading: Icon(iconData, color: Colors.black87, size: 25),
      title: Text(iconName,
          style: TextStyle(
              color: Colors.black87,
              fontSize: 15,
              fontWeight: FontWeight.bold)),
    );
  }

  clientData(String name, String profilePhoto) {
    return ListTile(
      leading: CircleAvatar(
        minRadius: 35.0,
        maxRadius: 35.0,
        backgroundImage: NetworkImage(profilePhoto),
      ),
      title: Text(
        name,
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        "View Profile",
        style: TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.normal),
      ),
    );
  }
}
