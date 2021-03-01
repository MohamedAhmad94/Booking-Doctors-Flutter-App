import 'package:DoctorsBooking/screens/bottomnavbar/bottomnavbar.dart';
import 'package:DoctorsBooking/screens/login.dart';

import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController resetEmailController = TextEditingController();

  bool pressed = true;
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
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
            field("Your Name", Icons.person_outline, TextInputType.name, false,
                nameController),
            field("Email Address", Icons.email, TextInputType.emailAddress,
                false, emailController),
            field("Mobile Number", Icons.phone, TextInputType.number, false,
                mobileNumberController),
            field("Password", Icons.lock, TextInputType.text, pressed,
                passwordController),
            Align(
              alignment: Alignment.bottomRight,
              child: InkWell(
                child: Text("Forgot Password?",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 17.0,
                        fontWeight: FontWeight.bold,
                        height: 1.5)),
                onTap: () {
                  return showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.0)),
                          title: Text(
                            "Enter Your Email",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          content: field(
                              "Email Address",
                              Icons.email,
                              TextInputType.emailAddress,
                              false,
                              resetEmailController),
                          actions: [
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              color: Colors.transparent,
                              child: Text("Send Code",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {},
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(
                                      color: Colors.grey, width: 0.5)),
                              color: Colors.transparent,
                              child: Text("Cancel",
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              onPressed: () {
                                return Navigator.pop(context);
                              },
                            ),
                          ],
                        );
                      });
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Checkbox(
                  value: check,
                  activeColor: Color(0xff00BBDC),
                  checkColor: Colors.blue,
                  hoverColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      check = value;
                    });
                  },
                ),
                Text(
                  "I accept the terms and conditions",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Builder(builder: (BuildContext context) {
              return FlatButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                color: Color(0xff00BBDC),
                child: Text(
                  "Create account",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                onPressed: () {
                  if (nameController.text.isEmpty) {
                    return Scaffold.of(context)
                        .showSnackBar(missingData("Your Name is Required"));
                  } else if (emailController.text.isEmpty) {
                    return Scaffold.of(context)
                        .showSnackBar(missingData("Email is Required"));
                  } else if (mobileNumberController.text.isEmpty) {
                    return Scaffold.of(context)
                        .showSnackBar(missingData("Mobile Number is Required"));
                  } else if (passwordController.text.isEmpty) {
                    return Scaffold.of(context)
                        .showSnackBar(missingData("Password is Required"));
                  } else if (check = false) {
                    return Scaffold.of(context).showSnackBar(
                        missingData("Accepting the Terms is required"));
                  } else {
                    return Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return BottomNavBar();
                    }));
                  }
                },
              );
            }),
            SizedBox(height: 5.0),
            FlatButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(color: Colors.grey, width: 0.5)),
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    minRadius: 20.0,
                    maxRadius: 20.0,
                    backgroundImage: NetworkImage(
                        "https://www.pngitem.com/pimgs/m/118-1181708_google-icon-google-logo-design-flaws-hd-png.png"),
                  ),
                  Text(
                    "Sign up with Google",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              onPressed: () {},
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: InkWell(
                child: Text(
                  "Have an account?",
                  style: TextStyle(
                      color: Color(0xff00BBDC),
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      height: 2.5),
                ),
                onTap: () {
                  return Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (_) {
                    return Login();
                  }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  field(String label, IconData icon, TextInputType type, bool obscure,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.grey, width: 0.5),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.red, width: 0.5),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.blue, width: 0.5),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15.0),
            borderSide: BorderSide(color: Colors.green, width: 0.5),
          ),
          labelText: label,
          labelStyle: TextStyle(color: Colors.grey),
          prefix: label == "Mobile Number"
              ? Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image(
                      image: NetworkImage(
                          "https://www.countryflags.com/wp-content/uploads/egypt-flag-png-large.png"),
                      width: 25,
                      height: 25,
                    ),
                    Text(
                      " +2",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                )
              : Icon(icon, color: Colors.grey),
          suffixIcon: label == "Password"
              ? IconButton(
                  icon: Icon(Icons.remove_red_eye),
                  color: Colors.grey,
                  iconSize: 20.0,
                  onPressed: () {
                    setState(() {
                      pressed = !pressed;
                    });
                  })
              : null,
        ),
        textInputAction: TextInputAction.done,
        keyboardType: type,
        obscureText: obscure,
        controller: controller,
      ),
    );
  }

  missingData(String content) {
    return SnackBar(
      backgroundColor: Colors.red,
      duration: Duration(seconds: 3),
      content: Text(content),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15.0))),
    );
  }
}
