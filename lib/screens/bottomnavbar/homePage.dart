import 'package:doctors_booking/screens/bottomnavbar/appointments.dart';
import 'package:doctors_booking/screens/categoriesandoffers.dart';
import 'package:doctors_booking/screens/doctorProfile.dart';
import 'package:doctors_booking/screens/result.dart';
import 'package:doctors_booking/widgets/customappbar.dart';
import 'package:doctors_booking/widgets/homepageitem.dart';
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

  Map<int, List> offers = {
    0: [
      '25% Off',
      'https://img.freepik.com/free-vector/discount-concept-illustration_114360-1852.jpg?size=626&ext=jpg'
    ],
    1: [
      '50% Off',
      'https://image.freepik.com/free-vector/discount-loyalty-card-loyalty-program-customer-service-rewards-card-points-concept-isolated-concept-illustration-with-tiny-people-floral-elements-hero-image-website_126608-770.jpg'
    ],
    2: [
      'up to 75%',
      'https://image.freepik.com/free-vector/people-celebrating-with-gift-card-voucher-isolated-flat-vector-illustration-cartoon-happy-customers-winning-abstract-prize-certificate-discount-coupon-creative-strategy-camp-money_74855-8500.jpg'
    ],
    3: [
      '10% off',
      'https://image.freepik.com/free-vector/black-friday-shop-people-buying-super-discount-shop-online-service-promo-purchase-marketing-illustration_101179-927.jpg'
    ],
  };

  TextEditingController searchController = TextEditingController();

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
                child: searchField(),
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
            headLine('Today Offers'),
            Container(
              height: MediaQuery.of(context).size.height / 3,
              child: scrollSection(offers),
            ),
            headLine("Suggested Doctors"),
            suggestedDoctors("Dr. Mohamed Ahmed", "assets/images/doctor2.png",
                "General", " 4.7   25 Reviews"),
            suggestedDoctors("Dr. Ahmed Samy", "assets/images/doctor2.png",
                "Dental", " 4.9   35 Reviews"),
            suggestedDoctors("Dr. Ali Hassan", "assets/images/doctor2.png",
                "Cardio", " 4.8   45 Reviews"),
            headLine("My Appointments"),
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
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) {
          if (title == "Suggested Doctors") {
            return Result();
          } else if (title == "My Appointments") {
            return Appointments();
          } else {
            return CategoriesAndOffers(title);
          }
        }));
      },
    );
  }

  scrollSection(Map<int, List> map) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: categories.length,
      itemBuilder: (context, index) {
        return HomePageItem(map, index);
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
            ),
          ],
        ),
        trailing: Icon(Icons.navigate_next, color: Colors.grey, size: 25),
        onTap: () {
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
}
