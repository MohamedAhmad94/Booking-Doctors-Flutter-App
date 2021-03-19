import 'package:doctors_booking/models/categories/categoryController.dart';
import 'package:doctors_booking/models/doctors/doctorController.dart';
import 'package:scoped_model/scoped_model.dart';

class MainModel extends Model with CategoryController, DoctorController {}
