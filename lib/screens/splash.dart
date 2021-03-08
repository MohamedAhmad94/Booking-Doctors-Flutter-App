// import 'package:doctors_booking/screens/bottomnavbar/bottomnavbar.dart';
// import 'package:doctors_booking/screens/login.dart';
// import 'package:flutter/material.dart';
// import 'package:splashscreen/splashscreen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class SplashScreens extends StatefulWidget {
//   @override
//   _SplashScreensState createState() => _SplashScreensState();
// }

// class _SplashScreensState extends State<SplashScreens> {
//   bool? valid;

//   @override
//   void initState() async {
//     bool _valid = await checkDate();
//     setState(() {
//       valid = _valid;
//     });

//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SplashScreen(
//       seconds: 5,
//       navigateAfterSeconds: valid == true ? BottomNavBar() : Login(),
//       title: Text(
//         "Doctors Booking",
//         style: TextStyle(
//             color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
//       ),
//       image: Image.network(
//           "https://mms.businesswire.com/media/20160202006046/en/507319/5/dod-logo-icon-large_%281%29.jpg"),
//       backgroundColor: Colors.white,
//       loaderColor: Colors.red,
//     );
//   }

//   Future<bool> checkDate() async {
//     try {
//       SharedPreferences _user = await SharedPreferences.getInstance();
//       String? _data = _user.getString("email");
//       if (_data == null) {
//         return false;
//       } else {
//         return true;
//       }
//     } catch (e) {
//       return false;
//     }
//   }
// }
