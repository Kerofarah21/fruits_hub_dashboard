import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../utils/app_text_styles.dart';

AppBar customAppBar(
  BuildContext context, {
  required String title,
  List<Widget>? actions,
}) {
  return AppBar(
    centerTitle: true,
    title: Text(
      title,
      style: AppTextStyles.styleBold(
        context,
        AppColors.grayScale950,
        19,
      ),
    ),
    actions: actions,
  );
}
