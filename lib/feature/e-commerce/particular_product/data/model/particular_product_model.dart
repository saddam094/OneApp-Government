class ParticularProductModel {
  final String productName;
  final String rating;
  final double price;
  final String description;
  final String ownerPhone;
  final List<String> images;

  ParticularProductModel({
    required this.productName,
    required this.rating,
    required this.price,
    required this.description,
    required this.ownerPhone,
    required this.images,
  });

  factory ParticularProductModel.fromJson(Map<String, dynamic> json) {
    return ParticularProductModel(
      productName: json['productName'] as String,
      rating: json['rating'].toString(),
      price: (json['price'] as num).toDouble(),
      description: json['description'] as String,
      ownerPhone: json['ownerPhone'] as String,
      images: List<String>.from(json['image'] as List),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productName': productName,
      'rating': rating,
      'price': price,
      'description': description,
      'ownerPhone': ownerPhone,
      'image': images,
    };
  }
}