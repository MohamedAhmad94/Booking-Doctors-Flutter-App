import 'package:flutter/material.dart';
import 'package:doctors_booking/widgets/searchresult.dart';

class Result extends StatefulWidget {
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  Map<int, List> searchFilters = {
    0: [
      Icons.filter_list_sharp,
      'Filter',
      [
        'Rating Low to High',
        'Rating High to Low',
        'Price Low to High',
        'Price Hight to Low'
      ]
    ],
    1: [
      Icons.keyboard_arrow_down_rounded,
      'Gender',
      ['Male', 'Female']
    ],
    2: [
      Icons.keyboard_arrow_down_rounded,
      'Distance',
      ['5 KM', '10 KM', '15 KM', '20 KM']
    ],
    3: [
      Icons.keyboard_arrow_down_rounded,
      'Speciality',
      ['General', 'Cardio', 'Dental', 'Pediatric']
    ],
    4: [
      Icons.keyboard_arrow_down_rounded,
      'Location',
      ['Cairo', 'Giza', 'Alex', 'Suez']
    ],
    5: [
      Icons.keyboard_arrow_down_rounded,
      'Payment',
      ['Cash', 'Visa']
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
        title: Text("Browse",
            style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold)),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.grey[50],
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          children: [
            SafeArea(
              top: true,
              child: filter(searchFilters),
            ),
            Flexible(
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return SearchResult(
                    doctorName: "Dr. Ahmed Saber",
                    type: "Dental",
                    rating: 4.5,
                    reviews: 150,
                    location: "Cairo - Egypt",
                    fees: 200,
                    currency: "EGP",
                    image:
                        "https://pulse.doctor/media_/images/photos/doctor4.jpg",
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  filter(Map<int, List> map) {
    return Container(
      height: 60.0,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: map.length,
          itemBuilder: (context, index) {
            return FilterItemm(map, index);
          }),
    );
  }
}

class FilterItemm extends StatefulWidget {
  final Map<int, List> map;
  final int index;

  FilterItemm(this.map, this.index);
  @override
  _FilterItemmState createState() => _FilterItemmState();
}

class _FilterItemmState extends State<FilterItemm> {
  bool check = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20))),
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  children: [
                    SafeArea(
                      top: true,
                      child: Text("${widget.map[widget.index]![1]}",
                          style: TextStyle(
                              color: Color(0xff00BBDC),
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              height: 1)),
                    ),
                    Flexible(
                      child: ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: widget.map[widget.index]![2].length,
                          itemBuilder: (context, index) {
                            return filterSubItem(
                                widget.map[widget.index]![2][index]);
                          }),
                    ),
                  ],
                ),
              );
            });
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.fromLTRB(5, 15, 0, 0),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xff00BBDC), width: 1),
            borderRadius: BorderRadius.circular(10.0)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              '${widget.map[widget.index]![1]} ',
              style: TextStyle(
                  color: Color(0xff00BBDC),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            SizedBox(width: 5),
            Icon(
              widget.map[widget.index]![0],
              color: Color(0xff00BBDC),
              size: 30,
            )
          ],
        ),
      ),
    );
  }

  filterSubItem(String title) {
    return ListTile(
      title: Text(
        '$title',
        style: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      ),
      trailing: Checkbox(
        activeColor: Color(0xff00BBDC),
        hoverColor: Colors.white,
        checkColor: Colors.white,
        value: check,
        onChanged: (value) {
          setState(() {
            check = value!;
          });
        },
      ),
    );
  }
}
