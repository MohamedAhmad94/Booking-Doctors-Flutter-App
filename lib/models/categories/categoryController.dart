import 'package:doctors_booking/models/categories/categoryModel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryController extends Model {
  bool _isCategoryLoading = true;
  bool get isCategoryLoading => _isCategoryLoading;

  List<CategoryModel> _allCategories = [];
  List<CategoryModel> get allCategories => _allCategories;

  getCategories() async {
    _isCategoryLoading = true;
    notifyListeners();

    FirebaseFirestore firestore = FirebaseFirestore.instance;

    firestore.collection('Categories').get().then((QuerySnapshot shot) {
      shot.docs.forEach((doc) {
        final CategoryModel _newCategory = CategoryModel(
          id: doc.id,
          categoryName: doc['categoryName'],
          categoryImage: doc['categoryImage'],
        );
        _allCategories.add(_newCategory);
      });
    });

    _isCategoryLoading = false;
    notifyListeners();
  }
}
