import 'package:doctors_booking/models/mainmodel.dart';
import 'package:doctors_booking/widgets/homepageitem.dart';
import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
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
        title: Text("Categories",
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
          child: ScopedModelDescendant(
            builder: (context, child, MainModel model) {
              if (model.allCategories.isEmpty) {
                return Center(child: Text('No Categories Found'));
              } else {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2, childAspectRatio: 0.85),
                    scrollDirection: Axis.vertical,
                    itemCount: model.allCategories.length,
                    itemBuilder: (context, index) {
                      return HomePageItem(
                          model.allCategories[index].categoryImage,
                          model.allCategories[index].categoryName,
                          index);
                    });
              }
            },
          )),
    );
  }
}
