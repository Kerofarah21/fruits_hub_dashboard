import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import '../../../../generated/l10n.dart';
import 'widgets/add_product_view_body.dart';

class AddProductView extends StatelessWidget {
  const AddProductView({super.key});

  static const routeName = 'add-product';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context, title: S.of(context).add_product),
      body: const AddProductViewBody(),
    );
  }
}
