import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';
import '../../../constants/app_text_controlles.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/input_field.dart';

class CreateMyPostScreen extends StatelessWidget {
  const CreateMyPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Create post',
            style: AppFonts.title3
                .copyWith(fontWeight: FontWeight.bold, fontSize: 20)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(children: [
            SizedBox(height: 12),
            DottedBorder(
              borderType: BorderType.RRect,
              radius: Radius.circular(20),
              color: AppColors.lime250,
              strokeWidth: 2,
              dashPattern: [10, 5],
              child: Container(
                height: 150,
                width: 350,
                decoration: BoxDecoration(
                  color: AppColors.grayScale200,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(children: [
                  SizedBox(height: 25),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.cloud_upload,
                      size: 35,
                      color: AppColors.lime250,
                    ),
                  ),
                  Text(
                    'Upload your photo here',
                    style: AppFonts.body2.copyWith(fontSize: 14),
                  ),
                ]),
              ),
            ),
            SizedBox(height: 40),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('Title', style: AppFonts.body2.copyWith(color: AppColors.grayScale400,)),
              InputField(
                controller: TextEditingControllers.postTitle,
                labelText: 'Enter title post',
                isHiddenText: false,
                color: AppColors.grayScale400,
                textColor: AppColors.grayScale400,
              ),
              SizedBox(height: 10),
              Text('Post', style: AppFonts.body2.copyWith(color: AppColors.grayScale400,)),
              InputField(
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
