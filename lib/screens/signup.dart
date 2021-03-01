import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(scrollDirection: Axis.vertical, children: [
          Container(
            height: 150,
            margin: EdgeInsets.fromLTRB(10, 10, 10, 30),
            width: MediaQuery.of(context).size.width / 3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                    "https://mms.businesswire.com/media/20160202006046/en/507319/5/dod-logo-icon-large_%281%29.jpg"),
              ),
              shape: BoxShape.circle,
            ),
          ),
        ]),
      ),
    );
  }
}
