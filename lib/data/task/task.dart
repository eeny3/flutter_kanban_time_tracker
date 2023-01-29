import 'package:hive_flutter/adapters.dart';

part 'task.g.dart';

@HiveType(typeId: 3)
class Task {
  @HiveField(0)
  String title;

  @HiveField(1, defaultValue: '')
  String description;

  @HiveField(2, defaultValue: 0)
  int countDown;

  @HiveField(3)
  DateTime? dateTimeEntry;

  @HiveField(4, defaultValue: false)
  bool isTimerRunning;

  Task({
    required this.title,
    this.description = '',
    this.countDown = 0,
    this.dateTimeEntry,
    this.isTimerRunning = false,
  });
}
