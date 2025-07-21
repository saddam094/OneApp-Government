class ParticularServiceManProfileModel {
  final String name;
  final bool saved;
  final String services;
  final String phone;
  final double rating;
  final int reviewCount;
  final String address;
  final String image;
  final String bannerImage;
  final String about;
  final List<String> timeList;

  ParticularServiceManProfileModel({
    required this.name,
    required this.saved,
    required this.services,
    required this.phone,
    required this.rating,
    required this.reviewCount,
    required this.address,
    required this.image,
    required this.bannerImage,
    required this.about,
    required this.timeList
  });

  factory ParticularServiceManProfileModel.fromJson(Map<String, dynamic> json) {
    return ParticularServiceManProfileModel(
      name: json['name'] ?? '',
      saved: json['saved'] ?? false,
      services: json['services'] ?? '',
      phone: json['phone'] ?? '',
      rating: (json['rating'] ?? 0).toDouble(), // Convert int to double safely
      reviewCount: (json['reviewCount'] ?? 0), // Use int directly
      address: json['address'] ?? '',
      image: json['image'] ?? '', // Handle null safely
      bannerImage: json['bannerImage'] ?? '', // Handle null safely
      about: json['about'] ?? '', // Provide default empty string for missing fields
      timeList: (json['timeList'] as List?)?.map((e) => e.toString()).toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'saved': saved,
      'services': services,
      'phone': phone,
      'rating': rating, // Store as double
      'reviewCount': reviewCount, // Store as int
      'address': address,
      'image': image,
      'bannerImage': bannerImage,
      'about': about,
      'timeList': timeList,
    };
  }
}
