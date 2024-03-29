import 'package:doctors_booking/screens/doctorProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';
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

class _SearchResultState extends State<SearchResult>
    with SingleTickerProviderStateMixin {
  bool pressed = false;
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    _animation = Tween<double>(begin: 0.0, end: 125.0).animate(_controller)
      ..addListener(() {
        setState(() {
          _animation = _animation;
        });
      });
    _controller.forward();
    super.initState();
  }

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
                height: _animation.value,
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
                          color: Theme.of(context).primaryColor,
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
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                      FavIcon(),
                      Text("Book",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              height: 1)),
                      IconButton(
                          icon: Icon(Icons.calendar_today),
                          color: Theme.of(context).primaryColor,
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

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
