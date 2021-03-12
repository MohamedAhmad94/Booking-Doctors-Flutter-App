import 'package:doctors_booking/screens/doctorProfile.dart';
import 'package:flutter/material.dart';

class Doctors extends StatefulWidget {
  final String? doctorName;
  final String? type;
  final String? date;
  final String? time;
  final String? image;
  final String? className;

  Doctors(
      {this.doctorName,
      this.type,
      this.date,
      this.time,
      this.image,
      this.className});

  @override
  _DoctorsState createState() => _DoctorsState();
}

class _DoctorsState extends State<Doctors> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            height: 125.0,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(widget.image!),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.doctorName!,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              Text(
                widget.type!,
                style: TextStyle(
                    color: Color(0xff00BBDC),
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              Text(
                widget.date!,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              Text(
                widget.time!,
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                    height: 1.5),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  elevation: 1.0,
                  shadowColor: Colors.black,
                  backgroundColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  side: BorderSide(color: Colors.black, width: 1.0),
                ),
                child: Text(
                  "View Profile",
                  style: TextStyle(
                      color: Colors.blue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (_) {
                    return DoctorProfile();
                  }));
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
