import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constant/colors.dart';

class UploadImageCard extends StatelessWidget {
  final File? file;
  final VoidCallback onUpload;
  final String title;
  final String subtitle;

  const UploadImageCard({
    super.key,
    required this.file,
    required this.onUpload,
    this.title = 'Upload Image',
    this.subtitle = 'SVG recommended',
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
            color: file == null ? AppColor.grey600! : AppColor.primaryColor,
            width: 1.5,
          ),
        ),
        child: file == null ? _emptyState() : _filePreview(),
      ),
    );
  }

  /// ---------------- EMPTY STATE ----------------
  Widget _emptyState() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColor.primaryColor.withOpacity(0.1),
          ),
          child: Icon(
            Icons.cloud_upload_outlined,
            size: 48,
            color: AppColor.primaryColor,
          ),
        ),
        const SizedBox(height: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          subtitle,
          style: TextStyle(
            color: AppColor.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }

  /// ---------------- FILE PREVIEW ----------------
  Widget _filePreview() {
    // Check if this is a network URL (existing image) or local file path
    bool isNetworkImage =
        file!.path.startsWith('http://') || file!.path.startsWith('https://');

    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: isNetworkImage
                ? SvgPicture.network(
                    file!.path,
                    width: double.infinity,
                    fit: BoxFit.contain,
                    placeholderBuilder: (context) => Center(
                      child: CircularProgressIndicator(
                        color: AppColor.primaryColor,
                      ),
                    ),
                  )
                : SvgPicture.file(
                    file!,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
          ),
        ),
        const SizedBox(height: 8),
        Text(
          isNetworkImage
              ? 'Current Image (Tap to change)'
              : file!.path.split('/').last.split('\\').last,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: AppColor.grey,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}
