class ServiceCategoryListModel {
  final String id;
  final List<ServiceCategory> categories;

  ServiceCategoryListModel({
    required this.id,
    required this.categories,
  });

  factory ServiceCategoryListModel.fromJson(Map<String, dynamic> json) {
    return ServiceCategoryListModel(
      id: json['id'],
      categories: (json['categories'] as List)
          .map((item) => ServiceCategory.fromJson(item))
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

class ServiceCategory {
  final String categoryName;
  final String imageUrl;

  ServiceCategory({
    required this.categoryName,
    required this.imageUrl,
  });

  factory ServiceCategory.fromJson(Map<String, dynamic> json) {
    return ServiceCategory(
      categoryName: json['categoryName'],
      imageUrl: json['imageUrl'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'categoryName': categoryName,
      'imageUrl': imageUrl,
    };
  }
}

