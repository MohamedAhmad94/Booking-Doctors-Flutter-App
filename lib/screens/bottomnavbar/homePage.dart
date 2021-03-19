import 'package:doctors_booking/screens/bottomnavbar/appointments.dart';
import 'package:doctors_booking/screens/categories.dart';
import 'package:doctors_booking/screens/doctorProfile.dart';
import 'package:doctors_booking/screens/result.dart';
import 'package:doctors_booking/screens/searchmap.dart';
import 'package:doctors_booking/widgets/customappbar.dart';
import 'package:doctors_booking/widgets/homepageitem.dart';
import 'package:doctors_booking/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctors_booking/models/mainmodel.dart';

class HomePage extends StatefulWidget {
  final MainModel model;

  HomePage(this.model);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    widget.model.getCategories();
    widget.model.getDoctors();
    super.initState();
  }

  // Map<int, List> categories = {
  //   0: [
  //     'Dentist',
  //     'https://image.freepik.com/free-vector/children-s-dentist-patient_42515-334.jpg'
  //   ],
  //   1: [
  //     'General',
  //     'https://cdn.pixabay.com/photo/2020/12/09/16/41/stethoscope-5817919_1280.png'
  //   ],
  //   2: [
  //     'Cardiologist',
  //     'https://www.shareicon.net/data/512x512/2017/03/27/881663_medical_512x512.png'
  //   ],
  //   3: [
  //     'Pediatrician',
  //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJQtnoIW8DcWTBL-C9vMA3CQOMUxQA1GEbtA&usqp=CAU'
  //   ],
  // };

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child:
            ScopedModelDescendant(builder: (context, child, MainModel model) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              CustomAppBar(
                200,
                "Search Nearby Doctors",
                Container(
                  margin: EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: ListTile(
                    leading: Icon(
                      Icons.location_on,
                      size: 25,
                      color: Colors.white,
                    ),
                    title: Text("Search by Location",
                        style: TextStyle(color: Colors.white, fontSize: 20.0)),
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              fullscreenDialog: true,
                              builder: (_) {
                                return SearchMap();
                              }));
                    },
                  ),
                ),
                'Home',
              ),
              Container(
                height: 150.0,
                margin: EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Color(0xffedf7f8),
                  borderRadius: BorderRadius.circular(20.0),
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://i.pinimg.com/736x/9f/32/20/9f3220f4535dd9cd9743b995fdfdeaa1.jpg'),
                    alignment: Alignment.centerRight,
                    // fit: BoxFit.fill,
                  ),
                ),
                alignment: Alignment.centerLeft,
                child: Text(
                  " Schedule your\n Next Appoinmtment\n Today",
                  style: TextStyle(
                      color: Color(0xff03CBC8),
                      fontSize: 17.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              headLine("Categories"),
              Container(
                height: MediaQuery.of(context).size.height / 3,
                child: model.isCategoryLoading == true
                    ? Center(child: Loading())
                    : model.allCategories.isEmpty
                        ? Center(child: Text('no data found'))
                        : scrollSection(model),
              ),
              headLine("Suggested Doctors"),
              allDoctors(model),
            ],
          );
        }),
      ),
    );
  }

  headLine(String title) {
    return ListTile(
      title: Text(title,
          style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
              fontWeight: FontWeight.bold)),
      trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 25),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          if (title == "Suggested Doctors") {
            return Result();
          } else if (title == "My Appointments") {
            return Appointments();
          } else {
            return Categories();
          }
        }));
      },
    );
  }

  scrollSection(MainModel model) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: model.allCategories.length,
      itemBuilder: (context, index) {
        return HomePageItem(model.allCategories[index].categoryImage,
            model.allCategories[index].categoryName, index);
      },
    );
  }

  suggestedDoctors(String doctorName, String doctorImage, String doctorCategory,
      double doctorRating, String id, MainModel model) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          minRadius: 40.0,
          maxRadius: 40.0,
          backgroundImage: NetworkImage(doctorImage),
        ),
        title: Text(
          doctorName,
          style: TextStyle(
              color: Colors.black54, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              doctorCategory,
              style: TextStyle(
                  color: Color(0xff03CBC8),
                  fontSize: 15.0,
                  fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                RatingBar(
                    minRating: 1.0,
                    maxRating: 5.0,
                    initialRating: doctorRating,
                    direction: Axis.horizontal,
                    itemCount: 5,
                    itemSize: 15,
                    allowHalfRating: true,
                    glowColor: Colors.yellow,
                    unratedColor: Colors.grey,
                    ratingWidget: RatingWidget(
                        full: Icon(Icons.star, color: Colors.amber),
                        half: Icon(Icons.star_half, color: Colors.amber),
                        empty: Icon(Icons.star_border, color: Colors.amber)),
                    onRatingUpdate: (doctorRating2) {
                      setState(() {
                        doctorRating = doctorRating2;
                      });
                    }),
                Text(
                  "${doctorRating.toString()}",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
        trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 25),
        onTap: () {
          model.getDoctorID(id);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) {
              return DoctorProfile();
            }),
          );
        },
      ),
    );
  }

  searchField() {
    return TextField(
      decoration: InputDecoration(
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        labelText: 'Search By Location',
        labelStyle: TextStyle(color: Colors.white),
        prefixIcon: Icon(Icons.search, color: Colors.white),
      ),
      textInputAction: TextInputAction.search,
      keyboardType: TextInputType.text,
      controller: searchController,
      onSubmitted: (value) {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          return Result();
        }));
      },
    );
  }

  allDoctors(MainModel model) {
    if (model.isGetDoctorloading == true) {
      return Center(child: Loading());
    } else if (model.allDoctors.isEmpty) {
      return Center(child: Text('No Suggested Doctors Available'));
    } else {
      return Column(
        children: [
          for (var i in model.allDoctors)
            suggestedDoctors(
                i.doctorName!, i.image!, i.category!, i.rating!, i.id!, model),
        ],
      );
    }
  }
}
