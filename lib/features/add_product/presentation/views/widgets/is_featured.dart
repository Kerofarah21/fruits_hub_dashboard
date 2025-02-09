import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'custom_check_box.dart';

class IsFeatured extends StatefulWidget {
  const IsFeatured({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<IsFeatured> createState() => _IsFeaturedState();
}

class _IsFeaturedState extends State<IsFeatured> {
  bool isFeatured = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isFeatured,
          onChanged: (value) => setState(() {
            isFeatured = value;
            widget.onChanged(value);
          }),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            S.of(context).is_featured_item,
            style: AppTextStyles.styleSemiBold(
              context,
              AppColors.grayScale400,
              13,
            ),
          ),
        ),
      ],
    );
  }
}
