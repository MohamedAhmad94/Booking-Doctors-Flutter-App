// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:scoped_model/scoped_model.dart';
// import 'package:doctors_booking/widgets/loading.dart';
// import 'package:doctors_booking/models/mainmodel.dart';

// class Add extends StatefulWidget {
//   @override
//   _AddState createState() => _AddState();
// }

// class _AddState extends State<Add> with TickerProviderStateMixin {
//   TabController? tabController;
//   TextEditingController categoryTitleController = TextEditingController();
//   GlobalKey<FormState> categoryTitleKey = GlobalKey<FormState>();
//   final _categoryFormKey = GlobalKey<FormState>();

//   final _doctorFormKey = GlobalKey<FormState>();

//   TextEditingController doctorNameController = TextEditingController();
//   GlobalKey<FormState> doctorNameKey = GlobalKey<FormState>();
//   TextEditingController categoryController = TextEditingController();
//   GlobalKey<FormState> categoryKey = GlobalKey<FormState>();
//   TextEditingController universityController = TextEditingController();
//   GlobalKey<FormState> universityyKey = GlobalKey<FormState>();
//   TextEditingController locationController = TextEditingController();
//   GlobalKey<FormState> locationKey = GlobalKey<FormState>();
//   TextEditingController feesController = TextEditingController();
//   GlobalKey<FormState> feesKey = GlobalKey<FormState>();
//   TextEditingController ratingController = TextEditingController();
//   GlobalKey<FormState> ratingKey = GlobalKey<FormState>();
//   TextEditingController reviewsController = TextEditingController();
//   GlobalKey<FormState> reviewsKey = GlobalKey<FormState>();
//   TextEditingController currencyController = TextEditingController();
//   GlobalKey<FormState> currencyKey = GlobalKey<FormState>();

//   PickedFile? image;
//   final picker = ImagePicker();

//   @override
//   void initState() {
//     tabController = TabController(length: 2, initialIndex: 0, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[50],
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         elevation: 0.0,
//         iconTheme: IconThemeData(color: Colors.black, size: 20.0),
//         title: Text(
//           "Add",
//           style: TextStyle(
//               color: Colors.black, fontSize: 20, fontWeight: FontWeight.normal),
//         ),
//         centerTitle: true,
//         backgroundColor: Colors.transparent,
//         bottom: PreferredSize(
//           preferredSize: Size(0.0, 50.0),
//           child: TabBar(
//             tabs: [
//               Text("New Categories"),
//               Text("New Doctors"),
//             ],
//             controller: tabController,
//             labelColor: Colors.black,
//             labelStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 20.0,
//                 fontWeight: FontWeight.bold),
//             unselectedLabelColor: Colors.grey,
//             unselectedLabelStyle: TextStyle(
//                 color: Colors.black,
//                 fontSize: 17.0,
//                 fontWeight: FontWeight.bold),
//             indicator: BoxDecoration(
//                 borderRadius: BorderRadius.circular(15.0),
//                 border: Border.all(color: Colors.black, width: 1.0)),
//           ),
//         ),
//       ),
//       body: Container(
//         margin: EdgeInsets.all(10.0),
//         child: TabBarView(
//           controller: tabController,
//           children: [category(), doctor()],
//         ),
//       ),
//     );
//   }

//   category() {
//     return Form(
//         key: _categoryFormKey,
//         child: ListView(
//           scrollDirection: Axis.vertical,
//           children: [
//             field("Category", TextInputType.text, categoryTitleController,
//                 categoryTitleKey),
//             ScopedModelDescendant(builder: (context, child, MainModel model) {
//               return Builder(builder: (BuildContext context) {
//                 return TextButton(
//                   style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0)),
//                     backgroundColor: Color(0xff00BBDC),
//                   ),
//                   child: model.isAddCategoryLoading == true
//                       ? Center(child: Loading())
//                       : Text(
//                           'Add Category',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                   onPressed: () async {
//                     if (!_categoryFormKey.currentState!.validate()) {
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(missingDate("Fields are Required"));
//                     } else {
//                       model.addCategory(categoryTitleController.text,
//                           'https://pulse.doctor/media_/images/photos/doctor4.jpg');
//                     }
//                   },
//                 );
//               });
//             }),
//           ],
//         ));
//   }

//   doctor() {
//     return Form(
//       key: _doctorFormKey,
//       child: ListView(
//         scrollDirection: Axis.vertical,
//         children: [
//           Container(
//             margin: EdgeInsets.all(8.0),
//             child: ListTile(
//               leading: CircleAvatar(
//                   minRadius: 40.0,
//                   maxRadius: 40.0,
//                   backgroundImage: NetworkImage(
//                       'https://pulse.doctor/media_/images/photos/doctor4.jpg')),
//               onTap: () {
//                 showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         backgroundColor: Colors.white,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(20.0)),
//                         title: Text(
//                           'Choose From Camera Or Gallery',
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 18.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         actions: [
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   side: BorderSide(
//                                       color: Colors.grey, width: 0.5)),
//                               backgroundColor: Colors.transparent,
//                             ),
//                             child: Text(
//                               'Gallery',
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             onPressed: () {
//                               getImage(ImageSource.gallery);
//                             },
//                           ),
//                           TextButton(
//                             style: TextButton.styleFrom(
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(15.0),
//                                   side: BorderSide(
//                                       color: Colors.grey, width: 0.5)),
//                               backgroundColor: Colors.transparent,
//                             ),
//                             child: Text(
//                               'Camera',
//                               style: TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 20.0,
//                                   fontWeight: FontWeight.bold),
//                             ),
//                             onPressed: () {
//                               getImage(ImageSource.camera);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//           ),
//           field("Doctor Name", TextInputType.text, doctorNameController,
//               doctorNameKey),
//           field(
//               "Category", TextInputType.text, categoryController, categoryKey),
//           field(
//               "Location", TextInputType.text, locationController, locationKey),
//           field("Fees", TextInputType.number, feesController, feesKey),
//           field("Rating", TextInputType.number, ratingController, ratingKey),
//           field("University", TextInputType.streetAddress, universityController,
//               universityyKey),
//           field("Reviews", TextInputType.number, reviewsController, reviewsKey),
//           field(
//               "Currecny", TextInputType.text, currencyController, currencyKey),
//           ScopedModelDescendant(builder: (context, child, MainModel model) {
//             return Builder(builder: (BuildContext context) {
//               return TextButton(
//                   style: TextButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(15.0)),
//                     backgroundColor: Color(0xff00BBDC),
//                   ),
//                   child: model.isAddCategoryLoading == true
//                       ? Center(child: Loading())
//                       : Text(
//                           'Add Doctor',
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 20.0,
//                               fontWeight: FontWeight.bold),
//                         ),
//                   onPressed: () async {
//                     if (!_doctorFormKey.currentState!.validate()) {
//                       ScaffoldMessenger.of(context)
//                           .showSnackBar(missingDate("Fields are Requiered"));
//                     } else {
//                       model.addDoctor(
//                           doctorNameController.text,
//                           categoryController.text,
//                           image!,
//                           locationController.text,
//                           int.parse(feesController.text),
//                           double.parse(ratingController.text),
//                           int.parse(reviewsController.text),
//                           universityController.text,
//                           "https://identityguide.hms.harvard.edu/files/hmsidentityguide/files/hms_logo_final_rgb.png?m=1580238232",
//                           currencyController.text);
//                     }
//                   });
//             });
//           }),
//         ],
//       ),
//     );
//   }

//   field(String label, TextInputType type, TextEditingController controller,
//       Key key) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: TextFormField(
//         key: key,
//         validator: (value) {
//           if (value!.isEmpty) {
//             return "This Field is Required";
//           } else {
//             return null;
//           }
//         },
//         decoration: InputDecoration(
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(color: Colors.grey, width: 0.5),
//           ),
//           errorBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(color: Colors.red, width: 0.5),
//           ),
//           enabledBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(color: Colors.grey, width: 0.5),
//           ),
//           focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(15.0),
//             borderSide: BorderSide(color: Colors.grey, width: 0.5),
//           ),
//           labelText: label,
//           labelStyle: TextStyle(color: Colors.grey),
//         ),
//         textInputAction: TextInputAction.done,
//         keyboardType: type,
//         controller: controller,
//       ),
//     );
//   }

//   missingDate(String content) {
//     return SnackBar(
//         backgroundColor: Colors.red,
//         duration: Duration(seconds: 3),
//         content: Text(content),
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
//         ));
//   }

//   getImage(ImageSource source) async {
//     var _pickedFile = await picker.getImage(source: source);
//     setState(() {
//       image = _pickedFile;
//     });
//   }
// }
