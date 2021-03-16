class DoctorModel {
  String? id;
  String? doctorName;
  String? category;
  String? image;
  String? location;
  int? fees;
  double? rating;
  int? reviews;
  String? university;
  String? collegeImage;

  DoctorModel(
      {this.id,
      this.doctorName,
      this.category,
      this.image,
      this.location,
      this.fees,
      this.rating,
      this.reviews,
      this.university,
      this.collegeImage});
}
