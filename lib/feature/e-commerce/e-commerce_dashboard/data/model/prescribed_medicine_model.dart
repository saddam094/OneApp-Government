class PrescribedMedicineModel {
  final int statusCode;
  final List<Medicine> medicines;

  PrescribedMedicineModel({
    required this.statusCode,
    required this.medicines,
  });

  factory PrescribedMedicineModel.fromJson(Map<String, dynamic> json) {
    return PrescribedMedicineModel(
      statusCode: json['statusCode'] as int,
      medicines: (json['body'] as List<dynamic>)
          .map((item) => Medicine.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'statusCode': statusCode,
      'body': medicines.map((medicine) => medicine.toJson()).toList(),
    };
  }
}

class Medicine {
  final String productId;
  final String productName;
  final double price;
  final String image;
  final String skuId;

  Medicine({
    required this.productId,
    required this.productName,
    required this.price,
    required this.image,
    required this.skuId
  });

  factory Medicine.fromJson(Map<String, dynamic> json) {
    return Medicine(
      productId: json['productId'] as String,
      productName: json['productName'] as String,
      price: (json['price'] != null) ? (json['price'] as num).toDouble() : 0.0, // ✅ Handle null price
      image: json['image'] as String,
      skuId: json['skuId'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'productName': productName,
      'price': price,
      'image': image,
      'skuId': skuId
    };
  }
}


// class Medicine {
//   final String productId;
//   final String productName;
//   final double price;
//   final String image;
//   final String skuId;
//
//   Medicine({
//     required this.productId,
//     required this.productName,
//     required this.price,
//     required this.image,
//     required this.skuId
//   });
//
//   factory Medicine.fromJson(Map<String, dynamic> json) {
//     return Medicine(
//       productId: json['productId'] as String,
//       productName: json['productName'] as String,
//       price: (json['price'] as num).toDouble(),
//       image: json['image'] as String,
//       skuId: json['skuId'] as String
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'productId': productId,
//       'productName': productName,
//       'price': price,
//       'image': image,
//       'skuId': skuId
//     };
//   }
// }
