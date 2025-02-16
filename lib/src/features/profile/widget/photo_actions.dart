import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/repository/image_uploader.dart';

class PhotoActions {
  final ImageUpload imageUpload = ImageUpload();

  Future<void> chooseFromLibrary(BuildContext context) async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        String signedUrl = await imageUpload.getSignedUrl(pickedFile.name);
        File imageFile = File(pickedFile.path);
        String imageUrl =
            await imageUpload.uploadImageToS3(imageFile, signedUrl);
        await imageUpload.saveUploadedImageUrl(imageUrl);
        Navigator.pop(context, imageUrl);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  Future<void> deletePhoto(BuildContext context) async {

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? imageUrl = prefs.getString('uploaded_image_url');

    if (imageUrl != null) {
      String fileKey = imageUrl.split('/').last;
      try {
        await imageUpload.deletePhoto(fileKey);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Photo deleted successfully')));
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Error: $e')));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('No photo to delete')));
    }
  }
}
