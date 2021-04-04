import 'package:doctors_booking/widgets/favicon.dart';
import 'package:doctors_booking/widgets/reviewitem.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctors_booking/models/mainmodel.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        child:
            ScopedModelDescendant(builder: (context, child, MainModel model) {
          return ListView(
            scrollDirection: Axis.vertical,
            children: [
              barItem(model),
              headline("Biography"),
              doctorCard(
                225,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("MEDICAL SCHOOL",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            height: 1.5)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image(
                            image: NetworkImage(
                                model.selectedDoctor.collegeImage!),
                            width: MediaQuery.of(context).size.width / 4,
                            height: 50.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${model.selectedDoctor.university.toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                            Text(
                              "Egypt",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "EDUCATION",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        Text(
                          "MBBS, FCPS, Clinical Medicine",
                          style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              headline("Rating"),
              doctorCard(
                450,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ListTile(
                        leading: Text(
                          "${model.selectedDoctor.rating.toString()}",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              height: 1),
                        ),
                        title: Text(
                          "Overall Rating",
                          style: TextStyle(
                              color: Colors.black54,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              height: 1.5),
                        ),
                        subtitle:
                            ratingBar(model.selectedDoctor.rating!, model)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ratings(5, 5.0),
                            ratings(4, 4.0),
                            ratings(3, 3.0),
                            ratings(2, 2.0),
                            ratings(1, 1.0),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            detailedRatings("Explains Condition Well",
                                model.selectedDoctor.rating!, model),
                            detailedRatings("Answers Questions",
                                model.selectedDoctor.rating!, model),
                            detailedRatings("Punctionality",
                                model.selectedDoctor.rating!, model),
                            detailedRatings("Professionalism",
                                model.selectedDoctor.rating!, model),
                            detailedRatings("Attitution",
                                model.selectedDoctor.rating!, model),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.black12,
                      thickness: 3,
                      height: 15,
                    ),
                    Text("He's expert in the field, I would recommend him",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal)),
                    ratingBar(model.selectedDoctor.rating!, model),
                    Divider(
                      color: Colors.black12,
                      thickness: 3,
                      height: 15,
                    ),
                    Text("He wasn't helpful, I would not recommend him",
                        style: TextStyle(
                            color: Colors.black54,
                            fontSize: 15.0,
                            fontWeight: FontWeight.normal)),
                    ratingBar(model.selectedDoctor.rating!, model),
                  ],
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  ratings(int rate, double width) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("${rate.toString()}",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1)),
        Container(
          margin: EdgeInsets.all(10),
          height: 8.0,
          color: Colors.amber,
          width: width * 15,
        ),
      ],
    );
  }

  detailedRatings(String type, double rating, MainModel model) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          type,
          style: TextStyle(
              color: Colors.black54,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
        Text(
          "${model.selectedDoctor.rating.toString()}",
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
      ],
    );
  }

  ratingBar(double currentRating, MainModel model) {
    return RatingBar(
      onRatingUpdate: (currentRating2) {
        setState(() {
          currentRating2 = currentRating;
        });
      },
      direction: Axis.horizontal,
      initialRating: model.selectedDoctor.rating!,
      itemCount: 5,
      itemSize: 15,
      minRating: 1.0,
      maxRating: 5.0,
      ratingWidget: RatingWidget(
        full: Icon(Icons.star, color: Colors.yellow),
        half: Icon(Icons.star_half, color: Colors.yellow),
        empty: Icon(Icons.star_border, color: Colors.yellow),
      ),
      glowColor: Colors.yellow,
      unratedColor: Colors.grey,
    );
  }

  doctorCard(double height, Widget widget) {
    return Card(
      elevation: 10.0,
      shadowColor: Colors.black,
      margin: EdgeInsets.all(20),
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.0)),
      child: Container(
        height: height,
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: widget,
      ),
    );
  }

  headline(String title) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline1,
      ),
    );
  }

  barItem(MainModel model) {
    return Container(
      height: 450,
      margin: EdgeInsets.only(bottom: 10.0),
      child: Stack(
        children: [
          Container(
            height: 250,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(model.selectedDoctor.image!),
                fit: BoxFit.fill,
              ),
            ),
            alignment: Alignment.topCenter,
            child: ListTile(
              leading: IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  iconSize: 30.0,
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              title: Text("Doctor Profile",
                  style: Theme.of(context).textTheme.headline1),
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 10.0,
            right: 10,
            top: 150,
            child: Container(
              height: 250,
              margin: EdgeInsets.all(20),
              child: Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                elevation: 10.0,
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(model.selectedDoctor.doctorName!,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Text(model.selectedDoctor.category!,
                              style: TextStyle(
                                  color: Color(0xff00BBDC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          ReviewItem(model.selectedDoctor.rating!,
                              model.selectedDoctor.reviews!),
                          Text(model.selectedDoctor.location!,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Text(
                              "${model.selectedDoctor.fees.toString()} ${model.selectedDoctor.currency.toString()}",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  iconSize: 40,
                                  color: Theme.of(context).primaryColor,
                                  onPressed: null),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Book Appointement",
                                      style: TextStyle(
                                          color: Color(0xff00BBDC),
                                          fontSize: 18.0,
                                          fontWeight: FontWeight.bold,
                                          height: 1)),
                                  Text(
                                      "Typically gets confirmed\n within 2 hours.",
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.normal)),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      FavIcon(),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
