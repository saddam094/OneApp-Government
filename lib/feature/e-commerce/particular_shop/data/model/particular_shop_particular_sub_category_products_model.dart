class ParticularShopParticularSubCategoryProductsModel {
  final int statusCode;
  final List<Product> products;

  ParticularShopParticularSubCategoryProductsModel({
    required this.statusCode,
    required this.products,
  });

  factory ParticularShopParticularSubCategoryProductsModel.fromJson(Map<String, dynamic> json) {
    return ParticularShopParticularSubCategoryProductsModel(
      statusCode: json['statusCode'] as int,
      products: (json['body'] as List)
          .map((productJson) => Product.fromJson(productJson))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final String productId;
  final String productName;
  final String skuId;
  final String rating;
  final String reviewCount;
  final String description;
  final String image;
  final String priceAfterDiscount;
  final String ownerPhone;

  Product({
    required this.productId,
    required this.productName,
    required this.skuId,
    required this.rating,
    required this.reviewCount,
    required this.description,
    required this.image,
    required this.priceAfterDiscount,
    required this.ownerPhone,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      skuId: json['skuId'] as String,
      rating: json['rating'].toString(),
      reviewCount: json['reviewCount'].toString(),
      description: json['description'] as String,
      image: json['image'] as String,
      priceAfterDiscount: json['priceAfterDiscount'].toString(),
      ownerPhone: json['ownerPhone'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'skuId': skuId,
      'rating': rating,
      'reviewCount': reviewCount,
      'description': description,
      'image': image,
      'priceAfterDiscount': priceAfterDiscount,
      'ownerPhone': ownerPhone,
    };
  }
}
