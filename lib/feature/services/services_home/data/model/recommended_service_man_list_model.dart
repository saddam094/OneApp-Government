class ServiceMan {
  final String serviceManId;
  final String name;
  final double rating;
  final String category;
  final int reviewCount;
  final String address;
  final String image;

  ServiceMan({
    required this.serviceManId,
    required this.name,
    required this.rating,
    required this.category,
    required this.reviewCount,
    required this.address,
    required this.image,
  });

  factory ServiceMan.fromJson(Map<String, dynamic> json) {
    return ServiceMan(
      serviceManId: json['serviceManId'] as String? ?? '',
      name: json['name'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      category: json['category'] as String? ?? '',
      reviewCount: json['reviewCount'] as int? ?? 0,
      address: json['address'] as String? ?? '',
      image: json['servicemanImage'] as String? ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'serviceManId': serviceManId,
      'name': name,
      'rating': rating,
      'category': category,
      'reviewCount': reviewCount,
      'address': address,
      'servicemanImage': image,
    };
  }
}


class RecommendedServiceManListModel {
  final String message;
  final List<ServiceMan> services;
  final String? lastEvaluatedKey;

  RecommendedServiceManListModel({
    required this.message,
    required this.services,
    this.lastEvaluatedKey,
  });

  factory RecommendedServiceManListModel.fromJson(Map<String, dynamic> json) {
    return RecommendedServiceManListModel(
      message: json['message'] ?? '',
      services: (json['services'] as List<dynamic>? ?? [])
          .map((item) => ServiceMan.fromJson(item))
          .toList(),
      lastEvaluatedKey: json['lastEvaluatedKey'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'services': services.map((item) => item.toJson()).toList(),
      'lastEvaluatedKey': lastEvaluatedKey,
    };
  }
}
