import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String patientName = "Faizal";
  Map<int, List> drawerData = {
    0: ['My Account', 'check your account data', Icons.account_circle_sharp],
    1: ['Setting', 'Choose your setting prefrences', Icons.settings],
    2: ['Book', 'choose and book a doctor', Icons.book_online],
    3: ['Location', 'Find the nearest doctors', Icons.add_location],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: AppBar(
          backgroundColor: Color(0xff03CBC8),
          title: Text("Asslamu Alaikum,\nHow are your feeling, $patientName?",
              style: TextStyle(
                  color: Color(0xffF7F8FB),
                  fontSize: 15,
                  fontWeight: FontWeight.normal)),
        ),
      ),
      drawer: Drawer(
        child: ListView.builder(
            itemCount: drawerData.length,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(15.0),
                ),
                margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: ListTile(
                  leading:
                      Icon(drawerData[index][2], color: Colors.black, size: 20),
                  title: Text(drawerData[index][0],
                      style: TextStyle(color: Colors.black, fontSize: 20)),
                  subtitle: Text(drawerData[index][1],
                      style: TextStyle(color: Colors.black, fontSize: 15)),
                  trailing: Icon(Icons.arrow_forward_ios,
                      color: Colors.black, size: 20),
                ),
              );
            }),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(1.0)),
            margin: EdgeInsets.all(25),
            child: Image(
              image: AssetImage('assets/images/Schedule.png'),
              fit: BoxFit.fill,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text(
              "Categories",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            width: 200,
            height: 200,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Image(image: AssetImage('assets/images/Genral.png')),
                Image(image: AssetImage('assets/images/Dentisit.png')),
                Image(image: AssetImage('assets/images/Cardio.png')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
