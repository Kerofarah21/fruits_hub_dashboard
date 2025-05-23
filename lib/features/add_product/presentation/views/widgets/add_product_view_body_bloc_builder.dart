import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_bar.dart';
import '../../../../../core/widgets/custom_progress_hud.dart';
import '../../../../../generated/l10n.dart';
import '../../cubits/add_product_cubit/add_product_cubit.dart';
import 'add_product_view_body.dart';

class AddProductViewBodyBlocBuilder extends StatelessWidget {
  const AddProductViewBodyBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AddProductCubit, AddProductState>(
      listener: (context, state) {
        if (state is AddProductSuccess) {
          buildBar(
            context,
            message: S.of(context).product_added_successfully,
            color: Colors.green,
          );
          Navigator.pop(context);
        }
        if (state is AddProductFailure) {
          buildBar(
            context,
            message: state.errMessage,
            color: Colors.red[900],
          );
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
          isLoading: state is AddProductLoading,
          child: const AddProductViewBody(),
        );
      },
    );
  }
}
