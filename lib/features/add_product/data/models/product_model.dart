import 'dart:io';

import '../entities/product_entity.dart';

class ProductModel {
  final String name;
  final String description;
  final String code;
  final String price;
  String? imagePath;
  final File image;
  final bool isFeatured;

  ProductModel({
    required this.name,
    required this.description,
    required this.code,
    required this.price,
    this.imagePath,
    required this.image,
    required this.isFeatured,
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
    );
  }

  toJson() => {
        'name': name,
        'description': description,
        'code': code,
        'price': price,
        'imagePath': imagePath,
        'image': image,
        'isFeatured': isFeatured,
      };
}
