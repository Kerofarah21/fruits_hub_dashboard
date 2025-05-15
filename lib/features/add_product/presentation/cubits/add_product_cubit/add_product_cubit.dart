import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/entities/product_entity.dart';
import '../../../data/repos/image_repo/image_repo.dart';
import '../../../data/repos/product_repo/product_repo.dart';

part 'add_product_state.dart';

class AddProductCubit extends Cubit<AddProductState> {
  AddProductCubit(this.imageRepo, this.productRepo)
      : super(AddProductInitial());

  final ImageRepo imageRepo;
  final ProductRepo productRepo;

  Future<void> addProduct(ProductEntity productEntity) async {
    emit(AddProductLoading());

    var result = await imageRepo.uploadImage(productEntity.image);

    result.fold(
      (failure) => emit(AddProductFailure(failure.errMessage)),
      (url) async {
        productEntity.imagePath = url;

        var result = await productRepo.addProduct(productEntity);

        result.fold(
          (failure) => emit(AddProductFailure(failure.errMessage)),
          (success) => emit(AddProductSuccess()),
        );
      },
    );
  }
}
