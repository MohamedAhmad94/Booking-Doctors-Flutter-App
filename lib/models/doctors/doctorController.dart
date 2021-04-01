import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:doctors_booking/models/doctors/doctorModel.dart';
import 'package:image_picker/image_picker.dart';

mixin DoctorController on Model {
  bool _isAddDoctorLoading = true;
  bool get isAddDoctorloading => _isAddDoctorLoading;

  bool _isGetDoctorLoading = true;
  bool get isGetDoctorloading => _isGetDoctorLoading;

  List<DoctorModel> _allDoctors = [];
  List<DoctorModel> get allDoctors => _allDoctors;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  String? _selectedID;
  getDoctorID(String id) {
    return _selectedID = id;
  }

  DoctorModel get selectedDoctor {
    return _allDoctors.firstWhere((DoctorModel doctor) {
      return doctor.id == _selectedID;
    });
  }

  addDoctor(
      String doctorName,
      String category,
      PickedFile image,
      String location,
      int fees,
      double rating,
      int reviews,
      String university,
      String collegeImage,
      String currency) async {
    _isAddDoctorLoading = true;
    notifyListeners();

    Map<String, dynamic> _doctorDate = {
      "doctorName": doctorName,
      "category": category,
      "image": image,
      "location": location,
      "fees": fees,
      "rating": rating,
      "reviews": reviews,
      "university": university,
      "collegeImage": collegeImage,
      "currency": currency,
    };

    firestore.collection('DRs').add(_doctorDate);
    _isAddDoctorLoading = false;
    notifyListeners();
  }

  getDoctors() async {
    _isGetDoctorLoading = true;
    notifyListeners();

    firestore.collection('DRs').get().then((QuerySnapshot shot) {
      shot.docs.forEach((i) {
        final DoctorModel _newDoctor = DoctorModel.fromJson(i, i.id);
        _allDoctors.add(_newDoctor);
      });
    });

    _isGetDoctorLoading = false;
    notifyListeners();
  }
}
