import 'package:hive_flutter/adapters.dart';

part 'completed_task.g.dart';

@HiveType(typeId: 4)
class CompletedTask {
  @HiveField(0)
  String title;

  @HiveField(1)
  DateTime completionDate;

  @HiveField(2, defaultValue: '0')
  String timeSpent;

  CompletedTask({
    required this.title,
    required this.completionDate,
    required this.timeSpent,
  });
}