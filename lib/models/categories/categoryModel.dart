class CategoryModel {
  String? id;
  String? categoryName;
  String? categoryImage;

  CategoryModel({this.id, this.categoryName, this.categoryImage});

  factory CategoryModel.fromJson(i, id) {
    return CategoryModel(
        categoryName: i['categoryName'],
        categoryImage: i['categoryImage'],
        id: id);
  }
}
