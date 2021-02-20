import 'package:flutter/material.dart';

class Browse extends StatefulWidget {
  @override
  _BrowseState createState() => _BrowseState();
}

class _BrowseState extends State<Browse> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            Container(
              height: 100,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                leading: Icon(Icons.arrow_back_sharp,
                    color: Colors.black87, size: 25.0),
                title: Center(
                  child: Text(
                    "Browse",
                    style: TextStyle(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            Container(
              height: 120,
              margin: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0)),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  searchFilters("Filter", Icons.filter_alt_outlined),
                  searchFilters("Gender", Icons.arrow_drop_down),
                  searchFilters("Distance", Icons.arrow_drop_down),
                  searchFilters("Specialization", Icons.arrow_drop_down),
                  searchFilters("Rating", Icons.arrow_drop_down),
                  searchFilters("Fees", Icons.arrow_drop_down),
                ],
              ),
            ),
            listedDoctors(
                name: "Dr. Ahmed Saber",
                type: "Dentist",
                fees: "EGP 200",
                rating: "4.5 (170 Reviews)",
                languages: "Arabic - English",
                location: "Cairo - Maadi",
                image: "https://pulse.doctor/media_/images/photos/doctor4.jpg"),
            listedDoctors(
                name: "Dr. Ahmed Ali",
                type: "Cardio",
                fees: "EGP 150",
                rating: "4.7 (150 Reviews)",
                languages: "Arabic - English",
                location: "Cairo - Helwan",
                image:
                    "https://www.pinnaclecare.com/wp-content/uploads/2017/12/bigstock-African-young-doctor-portrait-28825394-300x425.jpg"),
            listedDoctors(
                name: "Dr. Adel Hamed",
                type: "General",
                fees: "EGP 350",
                rating: "4.8 (200 Reviews)",
                languages: "Arabic - English",
                location: "Giza - Zamalek",
                image:
                    "https://s3-eu-west-1.amazonaws.com/intercare-web-public/wysiwyg-uploads%2F1569586526901-doctor.jpg"),
            listedDoctors(
                name: "Dr. Samia Omar",
                type: "Therapy",
                fees: "EGP 400",
                rating: "4.6 (120 Reviews)",
                languages: "Arabic - English",
                location: "Cairo - Fifth Settlement",
                image:
                    "https://image.freepik.com/free-photo/beautiful-young-female-doctor-looking-camera-office_1301-7807.jpg"),
          ],
        ),
      ),
    );
  }

  searchFilters(String label, IconData iconData) {
    return Container(
      margin: EdgeInsets.all(10),
      height: 90,
      width: MediaQuery.of(context).size.width / 2.5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(width: 1.0, color: Colors.blue)),
      alignment: Alignment.center,
      child: ListTile(
        title: Text(
          label,
          style: TextStyle(
              color: Colors.blue, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: Icon(iconData, color: Colors.blue, size: 25.0),
      ),
    );
  }

  listedDoctors(
      {String name,
      String type,
      String rating,
      String location,
      String languages,
      String fees,
      String image}) {
    return Container(
      height: 250,
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 120,
            width: MediaQuery.of(context).size.width / 3.3,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image:
                  DecorationImage(image: NetworkImage(image), fit: BoxFit.fill),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              Text(type,
                  style: TextStyle(
                      color: Color(0xff00BBDC),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              Text(rating,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              Text(location,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              Text(languages,
                  style: TextStyle(
                      color: Colors.black54,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              Text(fees,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5)),
              doctorOptions("Add to Favorites", Icons.favorite_border),
              doctorOptions("Book Appointment", Icons.calendar_today_outlined),
            ],
          )
        ],
      ),
    );
  }

  doctorOptions(String option, IconData iconData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(iconData, color: Colors.blue, size: 20),
        Text(
          option,
          style: TextStyle(
              color: Colors.blue,
              fontSize: 15,
              fontWeight: FontWeight.bold,
              height: 1.5),
        ),
      ],
    );
  }
}
