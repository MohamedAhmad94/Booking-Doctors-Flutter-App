import 'package:doctors_booking/screens/bottomnavbar/bottomnavbar.dart';
import 'package:doctors_booking/screens/login.dart';

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

  bool pressed = true;
  bool checked = false;
  String countryCode = "Code";

  GlobalKey<FormState> nameKey = GlobalKey<FormState>();
  GlobalKey<FormState> emailKey = GlobalKey<FormState>();
  GlobalKey<FormState> numberKey = GlobalKey<FormState>();
  GlobalKey<FormState> passwordKey = GlobalKey<FormState>();

  final _formKey = GlobalKey<FormState>();

  DateTime birthDate = DateTime(1950);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10),
        child: Form(
          key: _formKey,
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
              field("Your Name", Icons.person_outline, TextInputType.name,
                  false, nameController, nameKey),
              field("Email Address", Icons.email, TextInputType.emailAddress,
                  false, emailController, emailKey),
              Row(
                children: [
                  PopupMenuButton(
                    child: Text(
                      countryCode,
                      style: TextStyle(
                          color: Colors.grey,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold),
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    itemBuilder: (BuildContext context) {
                      return <PopupMenuEntry<String>>[
                        PopupMenuItem(
                          child: Text(
                            "Egypt +2",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "+2",
                        ),
                        PopupMenuItem(
                          child: Text(
                            "UAE +967",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "+96",
                        ),
                        PopupMenuItem(
                          child: Text(
                            "Kuwait +965",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "+965",
                        ),
                        PopupMenuItem(
                          child: Text(
                            "KSA +966",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold),
                          ),
                          value: "+966",
                        ),
                      ];
                    },
                    onSelected: (String value) {
                      setState(() {
                        countryCode = value;
                      });
                    },
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: field(
                        "Mobile Number",
                        Icons.phone,
                        TextInputType.number,
                        false,
                        mobileNumberController,
                        numberKey),
                  )
                ],
              ),
              field("Password", Icons.lock, TextInputType.text, pressed,
                  passwordController, passwordKey),
              ListTile(
                title: Text(
                  "Date of Birth",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  "${birthDate.toString().substring(0, 10)}",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  var _pickedDate = await showDatePicker(
                    context: context,
                    firstDate: DateTime(1950),
                    lastDate: DateTime(2002),
                    initialDate: DateTime(1950),
                  );
                  setState(() {
                    birthDate = _pickedDate!;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    value: checked,
                    activeColor: Color(0xff00BBDC),
                    checkColor: Colors.blue,
                    hoverColor: Colors.white,
                    onChanged: (value) {
                      setState(() {
                        checked = value!;
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
                return TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Color(0xff00BBDC),
                  ),
                  child: Text(
                    "Create account",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (!_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context)
                          .showSnackBar(missingData("All Fields are Required"));
                    } else if (checked == false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                          missingData("Accepting the Terms is required"));
                    } else {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (_) {
                        return BottomNavBar();
                      }));
                    }
                  },
                );
              }),
              SizedBox(height: 5.0),
              TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(color: Colors.grey, width: 0.5)),
                  backgroundColor: Colors.transparent,
                ),
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
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (_) {
                      return Login();
                    }));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  field(String label, IconData icon, TextInputType type, bool obscure,
      TextEditingController controller, Key key) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        key: key,
        validator: (value) {
          if (value!.isEmpty) {
            return "This Field's Required";
          } else {
            return null;
          }
        },
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
          prefixIcon: Icon(icon, color: Colors.grey),
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
