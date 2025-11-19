import 'dart:io';

import 'package:file_picker/file_picker.dart';
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

Future<File?> fileUploadGallary([bool isSvg = false]) async {
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
