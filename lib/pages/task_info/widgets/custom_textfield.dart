import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/resources/styles.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String footerTitle;
  const CustomTextField({Key? key, required this.controller, required this.footerTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
      EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
      color: Palette.grey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: controller,
            style: TextStyles.textSize18Weight500.copyWith(
              color: Palette.white,
            ),
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
          SizedBox(
            height: 12.w,
          ),
          Row(
            children: [
              Text(
                'In list: ',
                style: TextStyles.textSize16Weight400.copyWith(
                  color: Palette.grey12,
                ),
              ),
              Text(
                footerTitle,
                style: TextStyles.textSize16Weight600.copyWith(
                  color: Palette.grey11,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
