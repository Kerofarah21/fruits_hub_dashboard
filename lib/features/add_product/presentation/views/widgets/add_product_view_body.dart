import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helper_functions/build_bar.dart';
import '../../../../../core/widgets/custom_button.dart';
import '../../../../../core/widgets/custom_text_form_field.dart';
import '../../../../../generated/l10n.dart';
import '../../../data/entities/product_entity.dart';
import '../../cubits/add_product_cubit/add_product_cubit.dart';
import 'image_field.dart';
import 'is_featured.dart';
import 'is_organic.dart';

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
  final TextEditingController expirationMonthsController =
      TextEditingController();
  final TextEditingController numOfCaloriesController = TextEditingController();
  final TextEditingController unitAmountController = TextEditingController();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  bool isFeatured = false;
  bool isOrganic = false;
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
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                hint: S.of(context).expiration_months,
                keyboardType: TextInputType.number,
                controller: expirationMonthsController,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                hint: S.of(context).num_of_calories,
                keyboardType: TextInputType.number,
                controller: numOfCaloriesController,
                textInputAction: TextInputAction.next,
              ),
              CustomTextFormField(
                hint: S.of(context).unit_amount,
                keyboardType: TextInputType.number,
                controller: unitAmountController,
                textInputAction: TextInputAction.done,
              ),
              IsFeatured(
                onChanged: (value) {
                  isFeatured = value;
                },
              ),
              IsOrganic(
                onChanged: (value) {
                  isOrganic = value;
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
                      final productEntity = ProductEntity(
                        image: image!,
                        name: productNameController.text,
                        description: productDescriptionController.text,
                        code: productCodeController.text,
                        price: productPriceController.text,
                        isFeatured: isFeatured,
                        expirationMonths:
                            int.parse(expirationMonthsController.text),
                        numOfCalories: int.parse(numOfCaloriesController.text),
                        unitAmount: int.parse(unitAmountController.text),
                        isOrganic: isOrganic,
                        reviews: [],
                      );
                      context.read<AddProductCubit>().addProduct(productEntity);
                    } else {
                      setState(() {
                        autovalidateMode = AutovalidateMode.always;
                      });
                    }
                  } else {
                    buildBar(
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
