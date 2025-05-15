import 'package:dartz/dartz.dart';
import 'package:fruits_hub_dashboard/features/add_product/data/entities/product_entity.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/database_service.dart';
import '../../../../../core/utils/end_point.dart';
import '../../models/product_model.dart';
import 'product_repo.dart';

class ProductRepoImp implements ProductRepo {
  final DatabaseService databaseService;

  ProductRepoImp(this.databaseService);

  @override
  Future<Either<Failure, void>> addProduct(ProductEntity productEntity) async {
    try {
      await databaseService.addData(
        path: EndPoint.products,
        data: ProductModel.fromEntity(productEntity).toJson(),
      );

      return const Right(null);
    } catch (e) {
      return Left(ServerFailure('Failed to add product'));
    }
  }
}
