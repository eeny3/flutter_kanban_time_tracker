import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:kanban_flutter/app.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/data/card/card.dart';
import 'package:kanban_flutter/data/completed_task/completed_task.dart';
import 'package:kanban_flutter/data/task/task.dart';
import 'package:kanban_flutter/di/di_container.dart';
import 'package:kanban_flutter/data/relation/relation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive
    ..initFlutter()
    ..registerAdapter(TaskAdapter())
    ..registerAdapter(RelationAdapter())
    ..registerAdapter(BoardCardAdapter())
    ..registerAdapter(BoardAdapter())
    ..registerAdapter(CompletedTaskAdapter());
  await Hive.openBox('kanban_panel');
  await initializeLocator();
  runApp(App());
}
