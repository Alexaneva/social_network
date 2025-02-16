import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ImageUpload {
  final String apiUrl = dotenv.env['API_URL'] ?? '';

  Future<String> getSignedUrl(String fileName) async {

    final response = await http.get(Uri.parse(
        '$apiUrl/v1/aws/signed-url?fileName=$fileName&fileCategory=AVATARS'));

    if (response.statusCode == 200) {
      final data = response.body;
      return data;
    } else {
      throw Exception('Failed to get signed URL: ${response.statusCode}');
    }
  }

  Future<String> uploadImageToS3(File image, String signedUrl) async {

    final response = await http.put(
      Uri.parse(signedUrl),
      headers: {
        'Content-Type': 'image/jpeg',
      },
      body: await image.readAsBytes(),
    );

    if (response.statusCode == 200) {
      return signedUrl.split('?')[0];
    } else {
      throw Exception('Failed to upload image: ${response.statusCode}');
    }
  }

  Future<void> deleteImage(String fileKey) async {

    final response = await http.delete(
      Uri.parse(
          '$apiUrl/v1/aws/delete-s3-file?fileKey=$fileKey&fileCategory=AVATARS'),
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to delete image: ${response.statusCode}');
    }
  }

  Future<void> chooseFromLibrary(BuildContext context) async {

    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      String signedUrl = await getSignedUrl(pickedFile.name);
      File imageFile = File(pickedFile.path);
      String imageUrl = await uploadImageToS3(imageFile, signedUrl);
      await saveUploadedImageUrl(imageUrl);
    }
  }

  Future<void> saveUploadedImageUrl(String imageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('uploaded_image_url', imageUrl);
  }

  Future<void> deletePhoto(String fileKey) async {
    await deleteImage(fileKey);
    await removeImageUrl(fileKey);
  }

  Future<void> removeImageUrl(String fileKey) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('uploaded_image_url');
  }
}
