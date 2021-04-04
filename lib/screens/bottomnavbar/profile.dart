// import 'package:doctors_booking/screens/add.dart';
import 'package:doctors_booking/screens/login.dart';
import 'package:doctors_booking/widgets/customappbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  PickedFile? image;
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    leading: image == null
                        ? CircleAvatar(
                            minRadius: 40.0,
                            maxRadius: 40.0,
                            backgroundImage: NetworkImage(
                                'https://freesvg.org/img/cliente.png'),
                          )
                        : CircleAvatar(
                            minRadius: 40.0,
                            maxRadius: 40.0,
                            backgroundImage: AssetImage(image!.path),
                          ),
                    title: Text(
                      "Faizal Ahmed",
                      style: Theme.of(context).textTheme.headline2,
                    ),
                    subtitle: Text(
                      "View Profile",
                      style: Theme.of(context).textTheme.headline4,
                    ),
                    onTap: () {
                      showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              backgroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              title: Text("Upload your Profile Photp",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold)),
                              actions: [
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.grey, width: 0.5)),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Text("Camera",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    getImage(ImageSource.camera);
                                  },
                                ),
                                TextButton(
                                  style: TextButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(15),
                                        side: BorderSide(
                                            color: Colors.grey, width: 0.5)),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Text("Gallery",
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    getImage(ImageSource.gallery);
                                  },
                                ),
                              ],
                            );
                          });
                    }),
              ),
              'Profile',
            ),
            menuItem("Add", Icons.add, () {}),
            menuItem("Favorites", Icons.favorite_border_sharp, () {}),
            menuItem("Payment Detailes", Icons.payment_sharp, () {}),
            menuItem("Logout", Icons.logout, () {
              FirebaseAuth.instance.signOut();
              Navigator.push(context, MaterialPageRoute(builder: (_) {
                return Login();
              }));
            }),
          ],
        ),
      ),
    );
  }

  menuItem(String iconName, IconData iconData, Function? onTap()) {
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
        onTap: onTap,
      ),
    );
  }

  getImage(ImageSource source) async {
    var _pickedFile = await picker.getImage(source: source);
    setState(() {
      image = _pickedFile;
    });
  }
}
