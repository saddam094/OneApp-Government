class DoctorBookingListModel {
  final int statusCode;
  final List<DoctorBooking> body;

  DoctorBookingListModel({
    required this.statusCode,
    required this.body,
  });

  factory DoctorBookingListModel.fromJson(Map<String, dynamic> json) {
    return DoctorBookingListModel(
      statusCode: json['statusCode'] as int,
      body: (json['body'] as List<dynamic>)
          .map((item) => DoctorBooking.fromJson(item as Map<String, dynamic>))
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

class DoctorBooking {
  final String doctorId;
  final String name;
  final String specialist;
  final double rating;
  final String fee;
  final String image;
  final String appointmentDate;
  final String appointedTime;

  DoctorBooking({
    required this.doctorId,
    required this.name,
    required this.specialist,
    required this.rating,
    required this.fee,
    required this.image,
    required this.appointmentDate,
    required this.appointedTime,
  });

  factory DoctorBooking.fromJson(Map<String, dynamic> json) {
    return DoctorBooking(
      doctorId: json['doctorId'] as String,
      name: json['name'] as String? ?? "Unknown",  // Default value for name
      specialist: json['specialist'] as String,
      rating: (json['rating'] is num)
          ? (json['rating'] as num).toDouble()
          : double.tryParse(json['rating'].toString()) ?? 0.0,
      fee: json['fee']?.toString() ?? "Not specified", // Handle null fee
      image: json['image'] as String? ?? "", // Default empty string
      appointmentDate: json['appointmentDate'] as String,
      appointedTime: json['appointedTime'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'doctorId': doctorId,
      'name': name,
      'specialist': specialist,
      'rating': rating,
      'fee': fee,
      'image': image,
      'appointmentDate': appointmentDate,
      'appointedTime': appointedTime,
    };
  }
}
