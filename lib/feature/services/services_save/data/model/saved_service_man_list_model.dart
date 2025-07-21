class SavedServiceManListModel {
  final int statusCode;
  final ServiceDetailsBody body;

  SavedServiceManListModel({
    required this.statusCode,
    required this.body,
  });

  factory SavedServiceManListModel.fromJson(Map<String, dynamic> json) {
    return SavedServiceManListModel(
      statusCode: json['statusCode'] ?? 0,
      body: ServiceDetailsBody.fromJson(json['body'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': body.toJson(),
    };
  }
}

class ServiceDetailsBody {
  final String message;
  final List<ServiceManDetails> serviceDetails;

  ServiceDetailsBody({
    required this.message,
    required this.serviceDetails,
  });

  factory ServiceDetailsBody.fromJson(Map<String, dynamic> json) {
    return ServiceDetailsBody(
      message: json['message'] ?? '',
      serviceDetails: (json['serviceDetails'] as List? ?? [])
          .map((item) => ServiceManDetails.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'serviceDetails': serviceDetails.map((item) => item.toJson()).toList(),
    };
  }
}

class ServiceManDetails {
  final String serviceManId;
  final int tstamp;
  final String fee;
  final String image;
  final String reviewCount;
  final String rating;
  final String about;
  final String category;
  final String address;
  final String name;
  final String phone;

  ServiceManDetails({
    required this.serviceManId,
    required this.tstamp,
    required this.fee,
    required this.image,
    required this.reviewCount,
    required this.rating,
    required this.about,
    required this.category,
    required this.address,
    required this.name,
    required this.phone,
  });

  factory ServiceManDetails.fromJson(Map<String, dynamic> json) {
    return ServiceManDetails(
      serviceManId: json['serviceManId'] ?? '',
      tstamp: json['tstamp'] ?? 0,
      fee: json['fee'] ?? 'Not provided',
      image: json['servicemanImage'] ?? '', // Handle nullable image
      reviewCount: (json['reviewCount'] ?? 0).toString(), // Convert int to String
      rating: (json['rating'] ?? 0).toString(), // Convert int to String
      about: json['about'] ?? '',
      category: json['category'] ?? '',
      address: json['serviceManInfo']?['address'] ?? 'Not available', // Extract from nested JSON
      name: json['serviceManInfo']?['name'] ?? 'Unknown', // Extract from nested JSON
      phone: json['serviceManInfo']?['phone'] ?? 'No phone', // Extract from nested JSON
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceManId': serviceManId,
      'tstamp': tstamp,
      'fee': fee,
      'image': image,
      'reviewCount': reviewCount,
      'rating': rating,
      'about': about,
      'category': category,
      'address': address,
      'name': name,
      'phone': phone,
    };
  }
}
