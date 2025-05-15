import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/services/get_it_service.dart';
import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import '../../data/repos/image_repo/image_repo.dart';
import '../../data/repos/product_repo/product_repo.dart';
import '../cubits/add_product_cubit/add_product_cubit.dart';
import 'widgets/add_product_view_body_bloc_builder.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).add_product),
      body: BlocProvider(
        create: (context) => AddProductCubit(
          getIt.get<ImageRepo>(),
          getIt.get<ProductRepo>(),
        ),
        child: const AddProductViewBodyBlocBuilder(),
      ),
    );
  }
}
