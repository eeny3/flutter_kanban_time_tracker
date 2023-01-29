import 'package:kanban_flutter/data/task/task.dart';
import 'package:hive_flutter/adapters.dart';

part 'card.g.dart';

@HiveType(typeId: 1)
class BoardCard {
  @HiveField(0)
  List<Task> tasks;

  @HiveField(1)
  String title;

  BoardCard({required this.title, required this.tasks,});
}
