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
  String? currency;

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
      this.collegeImage,
      this.currency});

  factory DoctorModel.fromJson(x, id) {
    return DoctorModel(
      id: id,
      doctorName: x["doctorName"],
      category: x["category"],
      image: x["image"],
      location: x["location"],
      fees: x["fees"],
      rating: x["rating"],
      reviews: x["reviews"],
      university: x["university"],
      collegeImage: x["collegeImage"],
      currency: x["currency"],
    );
  }
}
