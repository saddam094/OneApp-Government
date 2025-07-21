class ParticularCategoryServicesManListModel {
  final int statusCode;
  final List<ServiceMan> body;

  ParticularCategoryServicesManListModel({required this.statusCode, required this.body});

  factory ParticularCategoryServicesManListModel.fromJson(Map<String, dynamic> json) {
    return ParticularCategoryServicesManListModel(
      statusCode: json['statusCode'] ?? 0,
      body: (json['body'] as List? ?? []).map((item) => ServiceMan.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}

class ServiceMan {
  final String serviceManId;
  final String image;
  final String rating;
  final String reviewCount;
  final String category;
  final String address;
  final String name;
  final String phone;

  ServiceMan({
    required this.serviceManId,
    required this.image,
    required this.rating,
    required this.reviewCount,
    required this.category,
    required this.address,
    required this.name,
    required this.phone,
  });

  factory ServiceMan.fromJson(Map<String, dynamic> json) {
    return ServiceMan(
      serviceManId: json['serviceManId'] ?? '',
      image: json['image'] ?? '', // Handle null
      rating: (json['rating'] ?? 0).toString(), // Convert int to String
      reviewCount: (json['reviewCount'] ?? 0).toString(), // Convert int to String
      category: json['category'] ?? '',
      address: json['address'] ?? '', // Handle missing field
      name: json['name'] ?? '', // Handle missing field
      phone: json['phone'] ?? '', // Handle missing field
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceManId': serviceManId,
      'image': image,
      'rating': rating,
      'reviewCount': reviewCount,
      'category': category,
      'address': address,
      'name': name,
      'phone': phone,
    };
  }
}
