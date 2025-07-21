class ParticularShopSubCategoryModel {
  final int statusCode;
  final List<SubCategory> category;

  ParticularShopSubCategoryModel({
    required this.statusCode,
    required this.category,
  });

  factory ParticularShopSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return ParticularShopSubCategoryModel(
      statusCode: json['statusCode'],
      category: (json['body'] as List)
          .map((item) => SubCategory.fromJson(item))
          .toList(),
    );
  }
}

class SubCategory {
  final String subCategory;
  final String image;

  SubCategory({
    required this.subCategory,
    required this.image,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) {
    return SubCategory(
      subCategory: json['title'],
      image: json['image'],
    );
  }
}
