import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/resources/images.dart';

class BackgroundTile extends StatelessWidget {
  final int imageIndex;
  const BackgroundTile({Key? key, required this.imageIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        image: DecorationImage(
          image: AssetImage('$images/bc$imageIndex.jpg'),
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
