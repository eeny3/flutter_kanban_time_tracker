import 'package:kanban_flutter/data/task/task.dart';
import 'package:hive_flutter/adapters.dart';

part 'relation.g.dart';

@HiveType(typeId: 2)
class Relation {
  @HiveField(0)
  Task task;

  @HiveField(1)
  int from;

  Relation({required this.from, required this.task,});
}