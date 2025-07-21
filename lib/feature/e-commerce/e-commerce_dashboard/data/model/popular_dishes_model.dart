class PopularDishesModel {
  final List<Dish> dishes;

  PopularDishesModel({required this.dishes});

  factory PopularDishesModel.fromJson(Map<String, dynamic> json) {
    return PopularDishesModel(
      dishes: (json['body'] as List<dynamic>)
          .map((dish) => Dish.fromJson(dish as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'body': dishes.map((dish) => dish.toJson()).toList(),
    };
  }
}

class Dish {
  final String dishId;
  final String dishName;
  final String aboutDish;
  final String rating;
  final String reviewCount;
  final String image;
  final String skuId;

  Dish({
    required this.dishId,
    required this.dishName,
    required this.aboutDish,
    required this.rating,
    required this.reviewCount,
    required this.image,
    required this.skuId
  });

  factory Dish.fromJson(Map<String, dynamic> json) {
    return Dish(
      dishId: json['productId'] as String,
      dishName: json['productName'] as String,
      aboutDish: json['aboutDish'] as String,
      rating: json['rating'].toString(),
      reviewCount: json['reviewCount'].toString(),
      image: json['image'] as String,
      skuId: json['skuId'] as String
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dishId': dishId,
      'dishName': dishName,
      'aboutDish': aboutDish,
      'rating': rating,
      'reviewCount': reviewCount,
      'skuId': skuId
    };
  }
}
