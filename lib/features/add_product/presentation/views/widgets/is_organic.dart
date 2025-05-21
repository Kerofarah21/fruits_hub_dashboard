import 'package:flutter/material.dart';

import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/app_text_styles.dart';
import '../../../../../generated/l10n.dart';
import 'custom_check_box.dart';

class IsOrganic extends StatefulWidget {
  const IsOrganic({
    super.key,
    required this.onChanged,
  });

  final ValueChanged<bool> onChanged;

  @override
  State<IsOrganic> createState() => _IsOrganicState();
}

class _IsOrganicState extends State<IsOrganic> {
  bool isOrganic = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          isChecked: isOrganic,
          onChanged: (value) => setState(() {
            isOrganic = value;
            widget.onChanged(value);
          }),
        ),
        const SizedBox(
          width: 16,
        ),
        Flexible(
          child: Text(
            S.of(context).is_organic_product,
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
