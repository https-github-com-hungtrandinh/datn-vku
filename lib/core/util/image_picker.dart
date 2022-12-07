import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import '../value/strings.dart';

Future<File> getFromGallery() async {
  ImagePicker imagePicker = ImagePicker();
  XFile? pickedFile = await imagePicker.pickImage(
    source: ImageSource.gallery,
    maxWidth: 500,
    maxHeight: 500,
    imageQuality: 100,
  );
  return _cropImage(pickedFile!);
}

Future<File> _cropImage(XFile filePath) async {
  CroppedFile? croppedImage = await ImageCropper().cropImage(
      sourcePath: filePath.path,
      aspectRatio: const CropAspectRatio(ratioX: 16, ratioY: 16),
      compressQuality: 100,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: Strings.cropper,
            toolbarColor: Colors.deepOrange,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: Strings.cropper,
        ),
      ]);
  return File(croppedImage!.path);
}
