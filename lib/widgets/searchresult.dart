import 'package:doctors_booking/screens/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:doctors_booking/widgets/favicon.dart';
import 'package:doctors_booking/widgets/reviewitem.dart';

class SearchResult extends StatefulWidget {
  final String? doctorName;
  final String? type;
  final int? reviews;
  final String? image;
  final double? rating;
  final String? location;
  final int? fees;
  final String? currency;

  SearchResult(
      {this.doctorName,
      this.type,
      this.reviews,
      this.rating,
      this.image,
      this.location,
      this.fees,
      this.currency});

  @override
  _SearchResultState createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool pressed = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 125,
                margin: EdgeInsets.only(right: 10.0),
                width: MediaQuery.of(context).size.width / 4,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage(widget.image!),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.doctorName!,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  Text(widget.type!,
                      style: TextStyle(
                          color: Color(0xff00BBDC),
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  ReviewItem(widget.rating!, widget.reviews!),
                  Text(widget.location!,
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  Text("${widget.fees.toString()} ${widget.currency}",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          height: 1.5)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text("Add to",
                          style: TextStyle(
                              color: Color(0xff00BBDC),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                      FavIcon(),
                      Text("Book",
                          style: TextStyle(
                              color: Color(0xff00BBDC),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          color: Color(0xff00BBDC),
                          iconSize: 25.0,
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return DoctorProfile();
                            }));
                          })
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
