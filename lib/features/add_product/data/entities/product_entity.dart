import 'dart:io';

import 'review_entity.dart';

class ProductEntity {
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
  final List<ReviewEntity> reviews;

  ProductEntity({
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
}
