class MyCartModel {
  final double totalAmount;
  final List<Product> products;

  MyCartModel({
    required this.totalAmount,
    required this.products,
  });

  factory MyCartModel.fromJson(Map<String, dynamic> json) {
    return MyCartModel(
      totalAmount: (json['totalAmount'] as num).toDouble(),
      products: List<Product>.from(
        (json['products'] as List).map((item) => Product.fromJson(item)),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalAmount': totalAmount,
      'products': products.map((product) => product.toJson()).toList(),
    };
  }
}

class Product {
  final String productId;
  final String productName;
  final String description;
  final double price;
  final String image;
  final String category;
  final String subCategory;
  final int quantity;

  Product({
    required this.productId,
    required this.productName,
    required this.description,
    required this.price,
    required this.image,
    required this.category,
    required this.subCategory,
    required this.quantity,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      description: json['description'] as String,
      price: (json['price'] as num).toDouble(),
      image: json['image'] as String,
      category: json['category'] as String,
      subCategory: json['subCategory'] as String,
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'description': description,
      'price': price,
      'image': image,
      'category': category,
      'subCategory': subCategory,
      'quantity': quantity,
    };
  }
}
