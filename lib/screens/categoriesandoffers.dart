import 'package:DoctorsBooking/widgets/homepageitem.dart';
import 'package:flutter/material.dart';

class CategoriesAndOffers extends StatefulWidget {
  final String className;

  CategoriesAndOffers(this.className);

  @override
  _CategoriesAndOffersState createState() => _CategoriesAndOffersState();
}

class _CategoriesAndOffersState extends State<CategoriesAndOffers> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black, size: 20.0),
        title: Text(
            widget.className == "Categories"
                ? "${categories.length.toString()} Categories"
                : "${offers.length.toString()} Offers",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 0.85),
            scrollDirection: Axis.vertical,
            itemCount: widget.className == "Categories"
                ? categories.length
                : offers.length,
            itemBuilder: (context, index) {
              return HomePageItem(
                  widget.className == "Categories" ? categories : offers,
                  index);
            }),
      ),
    );
  }
}
