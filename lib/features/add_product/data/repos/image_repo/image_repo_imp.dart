import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import 'image_repo.dart';

class ImageRepoImp implements ImageRepo {
  @override
  Future<Either<Failure, String>> uploadImage(File image) {
    throw UnimplementedError();
  }
}
