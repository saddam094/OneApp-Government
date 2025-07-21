class GroceryDealsModel {
  final int statusCode;
  final List<GroceryDeal> groceries;

  GroceryDealsModel({
    required this.statusCode,
    required this.groceries,
  });

  // Factory method to create an instance from JSON
  factory GroceryDealsModel.fromJson(Map<String, dynamic> json) {
    return GroceryDealsModel(
      statusCode: json['statusCode'] as int,
      groceries: (json['body'] as List<dynamic>? ?? [])
          .map((item) => GroceryDeal.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': groceries.map((item) => item.toJson()).toList(),
    };
  }
}

class GroceryDeal {
  final String productId;
  final String productName;
  final double price;
  final String image;
  final String skuId;
  final double discount;
  final double priceAfterDiscount;

  GroceryDeal({
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.skuId,
    required this.discount,
    required this.priceAfterDiscount,
  });

  // Factory method to create an instance from JSON
  factory GroceryDeal.fromJson(Map<String, dynamic> json) {
    return GroceryDeal(
      productId: json['productId'] ?? '',
      productName: json['productName'] ?? '',
      price: _parseDouble(json['Price']), // ✅ Handle null & string conversion
      image: json['image'] ?? '',
      skuId: json['skuId'] ?? '',
      discount: _parseDouble(json['Discount']), // ✅ Fix for string discount
      priceAfterDiscount: _parseDouble(json['PriceAfterDiscount']), // ✅ Fix
    );
  }

  // Method to convert an instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'Price': price,
      'image': image,
      'skuId': skuId,
      'Discount': discount,
      'PriceAfterDiscount': priceAfterDiscount,
    };
  }

  // ✅ Helper function to safely parse numbers from strings or null values
  static double _parseDouble(dynamic value) {
    if (value is num) return value.toDouble(); // If already a number, return it
    if (value is String) return double.tryParse(value) ?? 0.0; // Convert string to double
    return 0.0; // Default to 0.0 if null or invalid type
  }
}
