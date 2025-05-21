import 'dart:io';

import '../entities/product_entity.dart';
import 'review_model.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final String price;
  String? imagePath;
  final File image;
  final bool isFeatured;
  final int expirationMonths;
  final bool isOrganic;
  final int numOfCalories;
  final int unitAmount;
  final num avgRating = 0;
  final num ratingCount = 0;
  final List<ReviewModel> reviews;

  ProductModel({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    this.imagePath,
    required this.image,
    required this.isFeatured,
    required this.expirationMonths,
    required this.isOrganic,
    required this.numOfCalories,
    required this.unitAmount,
    required this.reviews,
  });

  factory ProductModel.fromEntity(ProductEntity productEntity) {
    return ProductModel(
      name: productEntity.name,
      description: productEntity.description,
      code: productEntity.code,
      price: productEntity.price,
      imagePath: productEntity.imagePath,
      image: productEntity.image,
      isFeatured: productEntity.isFeatured,
      expirationMonths: productEntity.expirationMonths,
      numOfCalories: productEntity.numOfCalories,
      unitAmount: productEntity.unitAmount,
      isOrganic: productEntity.isOrganic,
      reviews: productEntity.reviews
          .map(
            (review) => ReviewModel.fromEntity(review),
          )
          .toList(),
    );
  }

  toJson() => {
        'name': name,
        'description': description,
        'code': code,
        'price': price,
        'imagePath': imagePath,
        'isFeatured': isFeatured,
        'expirationMonths': expirationMonths,
        'numOfCalories': numOfCalories,
        'unitAmount': unitAmount,
        'isOrganic': isOrganic,
        'reviews': reviews.map((review) => review.toJson()).toList(),
      };
}
