import 'package:flutter/material.dart';
import 'package:kanban_flutter/resources/styles.dart';

class TaskText extends StatelessWidget {
  const TaskText({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyles.textSize13Weight500.copyWith(color: Palette.white),
    );
  }
}
