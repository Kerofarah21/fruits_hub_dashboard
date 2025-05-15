import 'dart:io';

class ProductEntity {
  final String name;
  final String description;
  final String code;
  final String price;
  String? imagePath;
  final File image;
  final bool isFeatured;

  ProductEntity({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    this.imagePath,
    required this.image,
    required this.isFeatured,
  });
}
