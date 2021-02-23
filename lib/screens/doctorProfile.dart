import 'package:DoctorsBooking/widgets/rating.dart';
import 'package:flutter/material.dart';

class DoctorProfile extends StatefulWidget {
  @override
  _DoctorProfileState createState() => _DoctorProfileState();
}

class _DoctorProfileState extends State<DoctorProfile> {
  bool pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.pop(context);
              }),
          iconTheme: IconThemeData(color: Colors.black, size: 20),
          title: Text("Doctor Profile",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"),
                      fit: BoxFit.fill),
                ),
              ),
              Card(
                elevation: 20.0,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(10),
                child: Container(
                  height: 250,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Dr. Ashraf Sayed",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Text("Dental",
                              style: TextStyle(
                                  color: Color(0xff00BBDC),
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ratingBar(4.0),
                              Text("168 Reviews",
                                  style: TextStyle(
                                      color: Color(0xff00BBDC),
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                      height: 1.5)),
                            ],
                          ),
                          Text("Giza - Egypt",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Text("EGP 200",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  height: 1.5)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                  icon: Icon(Icons.calendar_today),
                                  iconSize: 40,
                                  color: Color(0xff00BBDC),
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
                      IconButton(
                          icon: Icon(pressed == false
                              ? Icons.favorite_border
                              : Icons.favorite),
                          iconSize: 30,
                          color: Color(0xff00BBDC),
                          onPressed: () {
                            setState(() {
                              pressed = !pressed;
                            });
                          })
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Biography",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                elevation: 20.0,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(10),
                child: Container(
                  height: 220,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
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
                                  "https://identityguide.hms.harvard.edu/files/hmsidentityguide/files/hms_logo_final_rgb.png?m=1580238232"),
                              width: MediaQuery.of(context).size.width / 3,
                              height: 100),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Harvard Medical School",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    height: 1.5),
                              ),
                              Text(
                                "United Arab Emirates",
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
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Rating",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Card(
                elevation: 20.0,
                shadowColor: Colors.black,
                margin: EdgeInsets.all(20),
                child: Container(
                  height: 380,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          leading: Text(
                            "4.0",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                height: 3),
                          ),
                          title: Text(
                            "Overall Rating",
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                height: 1.5),
                          ),
                          subtitle: ratingBar(4.0)),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ratings("5"),
                              ratings("4"),
                              ratings("3"),
                              ratings("2"),
                              ratings("1"),
                            ],
                          ),
                          VerticalDivider(
                            color: Colors.yellow,
                            thickness: 5,
                            width: 20.0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              detailedRatings("Explains Condition Well", "4.8"),
                              detailedRatings("Answers Questions", "4.2"),
                              detailedRatings("Punctionality", "3.2"),
                              detailedRatings("Professionalism", "3.2"),
                              detailedRatings("Attitution", "3.2"),
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
                      ratingBar(4.7),
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
                      ratingBar(2.5),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }

  ratings(String rate) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(rate,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1)),
        Icon(
          Icons.rate_review_outlined,
          color: Colors.yellow,
          size: 20,
        ),
      ],
    );
  }

  detailedRatings(String type, String rating) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
          rating,
          style: TextStyle(
              color: Colors.black,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1),
        ),
      ],
    );
  }

  ratingBar(double currentRating) {
    return RatingBar(
      onRatingUpdate: null,
      direction: Axis.horizontal,
      initialRating: currentRating,
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
}
