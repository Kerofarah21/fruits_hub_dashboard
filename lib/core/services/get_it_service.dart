import 'package:get_it/get_it.dart';

import '../../features/add_product/data/repos/image_repo/image_repo.dart';
import '../../features/add_product/data/repos/image_repo/image_repo_imp.dart';
import '../../features/add_product/data/repos/product_repo/product_repo.dart';
import '../../features/add_product/data/repos/product_repo/product_repo_imp.dart';
import 'fire_storage.dart';
import 'storage_service.dart';

final getIt = GetIt.instance;

void getItServiceSetup() {
  getIt.registerLazySingleton<StorageService>(() => FireStorage());
  getIt.registerLazySingleton<ImageRepo>(
      () => ImageRepoImp(getIt.get<StorageService>()));

  getIt.registerLazySingleton<ProductRepo>(() => ProductRepoImp());
}
