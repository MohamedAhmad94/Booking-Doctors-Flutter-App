import 'package:doctors_booking/models/categories/categoryModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

mixin CategoryController on Model {
  bool _isCategoryLoading = false;
  bool get isCategoryLoading => _isCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  bool _isAddCategoryLoading = false;
  bool get isAddCategoryLoading => _isAddCategoryLoading;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  getCategories() async {
    _isCategoryLoading = true;
    notifyListeners();

    // Firestore database decoding
    firestore.collection('Categories').get().then((QuerySnapshot shot) {
      shot.docs.forEach((i) {
        final CategoryModel _newCategory = CategoryModel.fromJson(i, i.id);
        _allCategories.add(_newCategory);
      });
    });

    _isCategoryLoading = false;
    notifyListeners();
  }

  addCategory(String categoryName, String categoryImage) async {
    _isAddCategoryLoading = true;
    notifyListeners();

    Map<String, dynamic> _data = {
      'categoryName': categoryName,
      'categoryImage': categoryImage,
    };

    // firestore database encoding

    firestore.collection('Categories').add(_data);

    _isAddCategoryLoading = false;
    notifyListeners();
  }
}
