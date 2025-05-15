import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../entities/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, void>> addProduct(ProductEntity productEntity);
}
