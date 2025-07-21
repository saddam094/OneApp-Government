class ParticularCategoryShopListModel {
  final int statusCode;
  final List<Shop> shops;

  ParticularCategoryShopListModel({
    required this.statusCode,
    required this.shops,
  });

  // Factory method to create an instance from JSON
  factory ParticularCategoryShopListModel.fromJson(Map<String, dynamic> json) {
    return ParticularCategoryShopListModel(
      statusCode: json['statusCode'] as int,
      shops: (json['body'] as List<dynamic>)
          .map((item) => Shop.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': shops.map((shop) => shop.toJson()).toList(),
    };
  }
}

class Shop {
  final String category;
  final String shopId;
  final String shopName;
  final String shopBannerimage;
  final String address;

  Shop({
    required this.category,
    required this.shopId,
    required this.shopName,
    required this.shopBannerimage,
    required this.address,
  });

  // Factory method to create an instance from JSON
  factory Shop.fromJson(Map<String, dynamic> json) {
    return Shop(
      category: json['category'] ?? '',
      shopId: json['shop_id'] ?? '',
      shopName: json['shopName'] ?? '',
      shopBannerimage: json['shopBannerimage'] ?? '',
      address: json['address'] ?? '',
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'category': category,
      'shop_id': shopId,
      'shopName': shopName,
      'shopBannerimage': shopBannerimage,
      'address': address,
    };
  }
}
