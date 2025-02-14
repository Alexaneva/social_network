
import 'package:flutter/material.dart';
import 'package:social_network/src/features/my_posts/widget/photo_upload_widget.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_text_controlles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/input_field.dart';
import 'create_post_app_bar.dart';

class CreateMyPostScreen extends StatelessWidget {
  const CreateMyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CreatePostCustomAppBar(title: 'Create post'),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(height: 12),
            PhotoUploadWidget(
              onUpload: () {},
            ),
            SizedBox(height: 40),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              InputField(
                label: 'Title',
                controller: TextEditingControllers.postTitle,
                labelText: 'Enter title post',
                isHiddenText: false,
                color: AppColors.grayScale400,
                textColor: AppColors.grayScale400,
              ),
              SizedBox(height: 10),
              InputField(
                label: 'Post',
                controller: TextEditingControllers.postTitle,
                labelText: 'Enter your post',
                isHiddenText: false,
                color: AppColors.grayScale200,
                textColor: AppColors.grayScale200,
              ),
            ]),
            SizedBox(height: 40),
            CustomButton(
              text: 'Publish',
              onPressed: (){
                Navigator.pop(context);
              },
              color: AppColors.grayScale500,
              backgroundColor:AppColors.grayScale200,
            ),
          ]),
        ),
      ),
    );
  }
}
