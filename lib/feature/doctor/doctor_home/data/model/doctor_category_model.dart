class DoctorCategoryModel {
  final String id;
  final List<Category> categories;

  DoctorCategoryModel({
    required this.id,
    required this.categories,
  });

  factory DoctorCategoryModel.fromJson(Map<String, dynamic> json) {
    return DoctorCategoryModel(
      id: json['id'] as String,
      categories: (json['categories'] as List)
          .map((item) => Category.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categories': categories.map((item) => item.toJson()).toList(),
    };
  }
}

class Category {
  final String categoryName;
  final String imageURL;

  Category({
    required this.categoryName,
    required this.imageURL,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      categoryName: json['categoryName'] as String,
      imageURL: json['imageURL'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'imageURL': imageURL,
    };
  }
}
