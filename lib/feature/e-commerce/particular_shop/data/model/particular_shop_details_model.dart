class ParticularShopDetailsModel {
  final String shopName;
  final String category;
  final String address; // Changed from Address to String
  final String rating;
  final String reviewCount;
  final String shopBannerImage;

  ParticularShopDetailsModel({
    required this.shopName,
    required this.category,
    required this.address,
    required this.rating,
    required this.reviewCount,
    required this.shopBannerImage,
  });

  factory ParticularShopDetailsModel.fromJson(Map<String, dynamic> json) {
    return ParticularShopDetailsModel(
      shopName: json['shopName'] as String,
      category: json['category'] as String,
      address: json['address'] as String, // no need to use Address.fromJson
      rating: json['rating'].toString(),
      reviewCount: json['reviewCount'].toString(),
      shopBannerImage: json['shopBannerimage'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'shopName': shopName,
      'category': category,
      'address': address,
      'rating': rating,
      'reviewCount': reviewCount,
      'shopBannerimage': shopBannerImage,
    };
  }
}
