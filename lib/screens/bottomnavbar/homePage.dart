import 'package:DoctorsBooking/widgets/customappbar.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<int, List> categories = {
    0: [
      'Dentist',
      'https://image.freepik.com/free-vector/children-s-dentist-patient_42515-334.jpg'
    ],
    1: [
      'General',
      'https://cdn.pixabay.com/photo/2020/12/09/16/41/stethoscope-5817919_1280.png'
    ],
    2: [
      'Cardiologist',
      'https://www.shareicon.net/data/512x512/2017/03/27/881663_medical_512x512.png'
    ],
    3: [
      'Pediatrician',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTJQtnoIW8DcWTBL-C9vMA3CQOMUxQA1GEbtA&usqp=CAU'
    ],
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            CustomAppBar(
              200,
              " Asslamu Alaikum,\n How are you feeling tody,\n Faizal?",
              Container(
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: ListTile(
                  leading: Icon(Icons.search, color: Colors.white, size: 25.0),
                  title: Text("Search By Location",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.normal)),
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
              child: scrollSection(categories),
            ),
            headLine("Suggested Doctors"),
            suggestedDoctors("Dr. Mohamed Ahmed", "assets/images/doctor2.png",
                "General", " 4.7   25 Reviews"),
            suggestedDoctors("Dr. Ahmed Samy", "assets/images/doctor2.png",
                "Dental", " 4.9   35 Reviews"),
            suggestedDoctors("Dr. Ali Hassan", "assets/images/doctor2.png",
                "Cardio", " 4.8   45 Reviews")
          ],
        ),
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
    );
  }

  scrollSection(Map<int, List> map) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return Container(
          width: MediaQuery.of(context).size.width / 2.5,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(map[index][1]),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color),
            ),
          ),
          alignment: Alignment.bottomCenter,
          child: Text(
            map[index][0],
            style: TextStyle(
                color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
          ),
        );
      },
    );
  }

  suggestedDoctors(String doctorName, String doctorImage, String doctorCategory,
      String doctorRating) {
    return Container(
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListTile(
        leading: CircleAvatar(
          minRadius: 25.0,
          maxRadius: 25.0,
          backgroundImage: AssetImage(doctorImage),
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
                Icon(Icons.star, color: Colors.amber, size: 15.0),
                Text(
                  doctorRating,
                  style: TextStyle(
                      color: Colors.amber,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
