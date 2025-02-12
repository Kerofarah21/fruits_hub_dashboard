import '../../entities/product_entity.dart';

abstract class ProductRepo {
  Future<void> addProduct(ProductEntity productEntity);
}
