import 'package:flutter/material.dart';

class HomePageItem extends StatefulWidget {
  final Map<int, List> map;
  final int index;

  HomePageItem(this.map, this.index);

  @override
  _HomePageItemState createState() => _HomePageItemState();
}

class _HomePageItemState extends State<HomePageItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      margin: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          image: DecorationImage(
              image: NetworkImage(widget.map[widget.index]![1]),
              fit: BoxFit.fill,
              colorFilter: ColorFilter.mode(Colors.black38, BlendMode.color))),
      alignment: Alignment.center,
      child: Text(
        widget.map[widget.index]![0],
        style: TextStyle(
            color: Colors.black, fontSize: 25.0, fontWeight: FontWeight.bold),
      ),
    );
  }
}
