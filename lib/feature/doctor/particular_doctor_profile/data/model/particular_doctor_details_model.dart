class ParticularDoctorDetailsModel {
  final String doctorId;
  final String name;
  final String specialist;
  final double rating;
  final int reviewsCount;
  final String fee;
  final String phone;
  final String image;
  final String about;
  final List<String> timeList;

  ParticularDoctorDetailsModel({
    required this.doctorId,
    required this.name,
    required this.specialist,
    required this.rating,
    required this.reviewsCount,
    required this.fee,
    required this.phone,
    required this.image,
    required this.about,
    required this.timeList,
  });

  factory ParticularDoctorDetailsModel.fromJson(Map<String, dynamic> json) {
    return ParticularDoctorDetailsModel(
      doctorId: json['doctor_id'] as String? ?? "",
      name: json['name'] as String? ?? "",
      specialist: json['category'] as String? ?? "Unknown",
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : double.tryParse(json['rating'].toString()) ?? 0.0,
      reviewsCount: (json['reviewsCount'] is int)
          ? json['reviewsCount'] as int
          : int.tryParse(json['reviewsCount'].toString()) ?? 0,
      fee: json['fee'].toString(),
      phone: json['phone'].toString(),
      image: json['image'] as String? ?? "",
      about: json['about'] as String? ?? "No biography available",
      timeList: (json['timeList'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'name': name,
      'specialist': specialist,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'fee': fee,
      'phone': phone,
      'image': image,
      'about': about,
      'timeList': timeList,
    };
  }
}