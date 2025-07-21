// class BookedServiceMan {
//   final String bookingId;
//   final String serviceManId;
//   final String name;
//   final String category;
//   final String rating;
//   final String fee;
//   final String image;
//   final String bookingDate;
//   final String bookedTime;
//
//   BookedServiceMan({
//     required this.bookingId,
//     required this.serviceManId,
//     required this.name,
//     required this.category,
//     required this.rating,
//     required this.fee,
//     required this.image,
//     required this.bookingDate,
//     required this.bookedTime,
//   });
//
//   factory BookedServiceMan.fromJson(Map<String, dynamic> json) {
//     return BookedServiceMan(
//       bookingId: json['booking_id'] as String,
//       serviceManId: json['serviceManId'] as String,
//       name: json['name'] as String? ?? "Unknown", // Default value if missing
//       category: json['category'] as String,
//       rating: (json['rating'] as num).toString(), // Convert num to String
//       fee: json['fee'] as String? ?? "Not provided", // Default value if missing
//       image: json['image'] as String? ?? "", // Default empty string
//       bookingDate: json['bookingDate'] as String,
//       bookedTime: json['bookedTime'] as String,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'booking_id': bookingId,
//       'serviceManId': serviceManId,
//       'name': name,
//       'category': category,
//       'rating': rating,
//       'fee': fee,
//       'image': image,
//       'bookingDate': bookingDate,
//       'bookedTime': bookedTime,
//     };
//   }
// }

class BookedServiceMan {
  final String bookingId;
  final String serviceManId;
  final String name;
  final String category;
  final String rating;
  final String fee;
  final String image;
  final String bookingDate;
  final String bookedTime;

  BookedServiceMan({
    required this.bookingId,
    required this.serviceManId,
    required this.name,
    required this.category,
    required this.rating,
    required this.fee,
    required this.image,
    required this.bookingDate,
    required this.bookedTime,
  });

  factory BookedServiceMan.fromJson(Map<String, dynamic> json) {
    return BookedServiceMan(
      bookingId: json['booking_id']?.toString() ?? '',
      serviceManId: json['serviceManId']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unknown',
      category: json['category']?.toString() ?? '',
      rating: json['rating']?.toString() ?? '0',
      fee: json['fee']?.toString() ?? 'Not provided',
      image: json['servicemanImage']?.toString() ?? '', // corrected key
      bookingDate: json['bookingDate']?.toString() ?? '',
      bookedTime: json['bookedTime']?.toString() ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'booking_id': bookingId,
      'serviceManId': serviceManId,
      'name': name,
      'category': category,
      'rating': rating,
      'fee': fee,
      'image': image,
      'bookingDate': bookingDate,
      'bookedTime': bookedTime,
    };
  }
}


class BookedServiceManListModel {
  final List<BookedServiceMan> bookedServiceMen;

  BookedServiceManListModel({required this.bookedServiceMen});

  factory BookedServiceManListModel.fromJson(List<dynamic> jsonList) {
    return BookedServiceManListModel(
      bookedServiceMen: jsonList.map((json) => BookedServiceMan.fromJson(json)).toList(),
    );
  }

  List<Map<String, dynamic>> toJson() {
    return bookedServiceMen.map((bookedServiceMan) => bookedServiceMan.toJson()).toList();
  }
}
