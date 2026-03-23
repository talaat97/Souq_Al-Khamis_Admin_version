import 'dart:io';

import 'package:flutter/material.dart';
import '../../../../core/constant/colors.dart';

class UploadImageCardItem extends StatelessWidget {
  final File? file;
  final VoidCallback onUpload;
  final File? newFile;
  const UploadImageCardItem({
    super.key,
    required this.file,
    required this.onUpload,
    required this.newFile,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onUpload,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: 220,
        width: double.infinity,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: AppColor.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: newFile == null ? AppColor.grey600! : AppColor.primaryColor,
            width: 1.5,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: newFile == null
                    ? Image.network(
                        file!.path,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      )
                    : Image.file(
                        newFile!,
                        width: double.infinity,
                        fit: BoxFit.contain,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
