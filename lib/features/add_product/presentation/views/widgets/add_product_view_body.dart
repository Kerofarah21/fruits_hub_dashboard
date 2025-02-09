import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../../core/helper_functions/build_error_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import 'image_field.dart';
import 'is_featured.dart';

class AddProductViewBody extends StatefulWidget {
  const AddProductViewBody({super.key});

  @override
  State<AddProductViewBody> createState() => _AddProductViewBodyState();
}

class _AddProductViewBodyState extends State<AddProductViewBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController productNameController = TextEditingController();
  final TextEditingController productDescriptionController =
      TextEditingController();
  final TextEditingController productCodeController = TextEditingController();
  final TextEditingController productPriceController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isFeatured = false;
  File? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            spacing: 16,
            children: [
              CustomTextFormField(
                hint: S.of(context).product_name,
                keyboardType: TextInputType.text,
                controller: productNameController,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                hint: S.of(context).product_description,
                keyboardType: TextInputType.text,
                controller: productDescriptionController,
                textInputAction: TextInputAction.next,
                maxLines: 5,
              ),
              CustomTextFormField(
                hint: S.of(context).product_code,
                keyboardType: TextInputType.text,
                controller: productCodeController,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                hint: S.of(context).product_price,
                keyboardType: TextInputType.number,
                controller: productPriceController,
                textInputAction: TextInputAction.done,
              ),
              IsFeatured(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              ImageField(
                onFileChanged: (image) {
                  this.image = image;
                },
              ),
              CustomButton(
                text: S.of(context).add_product,
                onPressed: () {
                  if (image != null) {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    buildSnackBar(
                      context,
                      message: S.of(context).select_image,
                    );
                  }
                },
              ),
              const SizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
