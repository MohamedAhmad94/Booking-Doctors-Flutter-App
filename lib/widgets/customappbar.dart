import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final double height;
  final String text;
  final Widget secondSection;
  final String className;

  CustomAppBar(this.height, this.text, this.secondSection, this.className);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(20), bottomLeft: Radius.circular(20)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).primaryColor,
            Theme.of(context).accentColor,
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          widget.className == 'Appointments'
              ? SizedBox()
              : Icon(Icons.sort, color: Colors.white, size: 25),
          Text(widget.text,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontWeight: FontWeight.bold)),
          widget.secondSection,
        ],
      ),
    );
  }
}
