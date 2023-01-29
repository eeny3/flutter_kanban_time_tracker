import 'package:hive_flutter/hive_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/data/card/card.dart';
import 'package:kanban_flutter/data/completed_task/completed_task.dart';
import 'package:kanban_flutter/data/task/task.dart';

@lazySingleton
class Storage {
  List<Board> boards = [];
  List<CompletedTask> completedTasks = [];
  final _box = Hive.box('kanban_panel');

  void createInitialData() {
    boards = [
      Board(
        title: 'Default Board',
        cards: [
          BoardCard(
            title: 'To Do',
            tasks: [
              Task(
                title: 'Wake Up',
              ),
            ],
          ),
          BoardCard(
            title: 'In Progress',
            tasks: [],
          ),
          BoardCard(
            title: 'Done',
            tasks: [],
          ),
        ],
        index: 0,
      ),
    ];
  }

  void loadData() {
    boards = _box.get('boards').cast<Board>();
  }

  void loadTaskHistory() {
    final boxHistory = _box.get('history');
    completedTasks =
        boxHistory != null ? _box.get('history').cast<CompletedTask>() : [];
  }

  void updateStorage() {
    _box.put('boards', boards);
  }

  void updateHistory() {
    _box.put('history', completedTasks);
  }
}
