import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_fonts.dart';

class ShowDatePickerDialog extends StatelessWidget {
  final TextEditingController controller;

  const ShowDatePickerDialog({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 216,
            width: 300,
            child: Column(
              children: [
                Text('Pick the date of your birth', style: AppFonts.headline1.copyWith(fontSize: 15, color: AppColors.grayScale500)),
                Divider(),
                Expanded(
                  child: CupertinoDatePicker(
                    initialDateTime: DateTime.now(),
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    mode: CupertinoDatePickerMode.date,
                    onDateTimeChanged: (DateTime newDate) {
                      controller.text = DateFormat('dd-MM-yyyy').format(newDate);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        AlertDialog(
          backgroundColor: Colors.white,
          content: SizedBox(
            height: 115,
            width: 300,
            child: Column(
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirm', style: AppFonts.headline1.copyWith(fontSize: 15, color: AppColors.lime250)),
                ),
                Divider(),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel', style: AppFonts.headline1.copyWith(fontSize: 15, color: AppColors.error)),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
