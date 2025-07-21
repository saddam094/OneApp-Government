class MyOrderModel {
  final int statusCode;
  final List<OrderItem> body;

  MyOrderModel({
    required this.statusCode,
    required this.body,
  });

  factory MyOrderModel.fromJson(Map<String, dynamic> json) {
    return MyOrderModel(
      statusCode: json['statusCode'],
      body: (json['body'] as List<dynamic>)
          .map((item) => OrderItem.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': body.map((item) => item.toJson()).toList(),
    };
  }
}

class OrderItem {
  final String productId;
  final String productName;
  final String about;
  final double price;
  final int quantity;
  final String image;
  final String orderId;
  final double totalAmount;

  OrderItem({
    required this.productId,
    required this.productName,
    required this.about,
    required this.price,
    required this.quantity,
    required this.image,
    required this.orderId,
    required this.totalAmount,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      about: json['about'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: json['quantity'],
      image: json['image'] as String,
      orderId: json['orderId'] as String,
      totalAmount: (json['totalAmount'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'about': about,
      'price': price,
      'quantity': quantity,
      'image': image,
      'orderId': orderId,
      'totalAmount': totalAmount,
    };
  }
}
