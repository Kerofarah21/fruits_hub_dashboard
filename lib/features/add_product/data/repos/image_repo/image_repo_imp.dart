import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../../../../../core/services/storage_service.dart';
import '../../../../../core/utils/end_point.dart';
import 'image_repo.dart';

class ImageRepoImp implements ImageRepo {
  final StorageService storageService;

  ImageRepoImp(this.storageService);

  @override
  Future<Either<Failure, String>> uploadImage(File image) async {
    try {
      String url = await storageService.uploadFile(EndPoint.images, image);
      return Right(url);
    } catch (e) {
      return Left(
        ServerFailure('Failed to upload image'),
      );
    }
  }
}
