class ParticularCategoryDoctorListModel {
  final int statusCode;
  final List<Doctor> body;

  ParticularCategoryDoctorListModel({
    required this.statusCode,
    required this.body,
  });

  factory ParticularCategoryDoctorListModel.fromJson(Map<String, dynamic> json) {
    return ParticularCategoryDoctorListModel(
      statusCode: json['statusCode'] as int,
      body: (json['body'] as List<dynamic>)
          .map((item) => Doctor.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}

class Doctor {
  final String name;
  final String doctorId;
  final int fee; // Changed from String to int
  final String specialist;
  final double rating;
  final int reviewsCount;
  final String image;
  final String doctorBiography;

  Doctor({
    required this.name,
    required this.doctorId,
    required this.fee,
    required this.specialist,
    required this.rating,
    required this.reviewsCount,
    required this.image,
    required this.doctorBiography,
  });

  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'] as String,
      doctorId: json['doctor_id'] as String,
      fee: (json['fee'] is int)
          ? json['fee'] as int
          : int.tryParse(json['fee'].toString()) ?? 0,
      specialist: json['specialist'] as String,
      rating: (json['rating'] is int)
          ? (json['rating'] as int).toDouble()
          : json['rating'] as double, // Handle rating conversion
      reviewsCount: json['reviewsCount'] as int,
      image: json['image'] as String,
      doctorBiography: json['doctorBiography'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'doctor_id': doctorId,
      'fee': fee, // No need to convert int to String
      'specialist': specialist,
      'rating': rating,
      'reviewsCount': reviewsCount,
      'image': image,
      'doctorBiography': doctorBiography,
    };
  }
}

