import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/utils/app_colors.dart';

class ImageField extends StatefulWidget {
  const ImageField({
    super.key,
    required this.onFileChanged,
  });

  final ValueChanged<File?> onFileChanged;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? fileImage;

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          try {
            final ImagePicker picker = ImagePicker();
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            fileImage = File(image!.path);
            widget.onFileChanged(fileImage!);
          } on Exception catch (_) {
            setState(() {
              isLoading = false;
            });
          }
          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.grayScale400),
                borderRadius: BorderRadius.circular(16),
              ),
              child: fileImage == null
                  ? const Icon(
                      Icons.image_outlined,
                      size: 180,
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(16),
                      child: Image.file(
                        fileImage!,
                      ),
                    ),
            ),
            Visibility(
              visible: fileImage != null,
              child: IconButton(
                onPressed: () {
                  setState(() {
                    fileImage = null;
                    widget.onFileChanged(fileImage);
                  });
                },
                icon: const Icon(Icons.delete),
              ),
            )
          ],
        ),
      ),
    );
  }
}
