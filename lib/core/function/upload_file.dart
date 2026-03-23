import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

imageUploadCamera() async {
  final pickedFile = await ImagePicker()
      .pickImage(source: ImageSource.camera, imageQuality: 90);
  if (pickedFile != null) {
    return File(pickedFile.path);
  } else {
    return null;
  }
}

Future<File?> fileUploadGallery([bool isSvg = false]) async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions:
        isSvg ? ['svg', 'SVG'] : ['jpg', 'png', 'jpeg', 'gif', 'bmp', 'webp'],
  );
  if (result != null && result.files.isNotEmpty) {
    return File(result.files.first.path!);
  } else {
    return null;
  }
}

Future<File?> compressImage(File file) async {
  final filePath = file.path;
  final lastIndex = filePath.lastIndexOf('.');
  final outPath = '${filePath.substring(0, lastIndex)}_compressed.jpg';

  final result = await FlutterImageCompress.compressAndGetFile(
    filePath, // input path
    outPath, // output path
    quality: 70, // 0-100 (70 is good balance)
    minWidth: 800, // max width
    minHeight: 800, // max height
    format: CompressFormat.jpeg,
  );

  if (result == null) return null;
  return File(result.path);
}
