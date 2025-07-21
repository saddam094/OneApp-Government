class PopularDoctorDetails {
  final String name;
  final String doctorId;
  final String specialist;
  final double rating;
  final int reviewsCount;
  final double fee;
  final String image;
  final String doctorBiography;

  PopularDoctorDetails({
    required this.name,
    required this.doctorId,
    required this.specialist,
    required this.rating,
    required this.reviewsCount,
    required this.fee,
    required this.image,
    required this.doctorBiography,
  });

  factory PopularDoctorDetails.fromJson(Map<String, dynamic> json) {
    return PopularDoctorDetails(
      name: json['name'] as String,
      doctorId: json['doctor_id'] as String,
      specialist: json['specialist'] as String,
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : double.tryParse(json['rating'].toString()) ?? 0.0,
      reviewsCount: (json['reviewsCount'] is int)
          ? json['reviewsCount'] as int
          : int.tryParse(json['reviewsCount'].toString()) ?? 0,
      fee: (json['fee'] is num)
          ? (json['fee'] as num).toDouble()
          : double.tryParse(json['fee'].toString()) ?? 0.0,
      image: json['image'] as String,
      doctorBiography: json['about'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctorId': doctorId,
      'specialist': specialist,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'fee': fee,
      'image': image,
      'doctorBiography': doctorBiography,
    };
  }
}

class PopularDoctorModel {
  final int statusCode;
  final List<PopularDoctorDetails> doctors;

  PopularDoctorModel({
    required this.statusCode,
    required this.doctors,
  });

  factory PopularDoctorModel.fromJson(Map<String, dynamic> json) {
    return PopularDoctorModel(
      statusCode: json['statusCode'] as int,
      doctors: (json['body'] as List)
          .map((doctor) =>
          PopularDoctorDetails.fromJson(doctor as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': doctors.map((doctor) => doctor.toJson()).toList(),
    };
  }
}

