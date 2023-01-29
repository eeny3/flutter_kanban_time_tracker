import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/data/completed_task/completed_task.dart';
import 'package:kanban_flutter/services/storage/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'task_info_page_store.g.dart';

@injectable
class TaskInfoPageStore = _TaskInfoPageStore with _$TaskInfoPageStore;

abstract class _TaskInfoPageStore with Store {
  Timer? _timer;
  Storage storage = GetIt.I();
  bool canUpdateTask = true;

  @observable
  bool isTimerRunning = false;

  @readonly
  int _countdown = 0;

  @action
  void _onTick(Timer timer) {
    _countdown++;
  }

  @action
  void startTimer() {
    isTimerRunning = true;
    _timer = Timer.periodic(const Duration(seconds: 1), _onTick);
  }

  @action
  void stopTimer() {
    isTimerRunning = false;
    _timer!.cancel();
  }

  void loadTask(int boardId, int cardId, int taskId) {
    final task = storage.boards[boardId].cards[cardId].tasks[taskId];
    if (task.isTimerRunning) {
      final DateTime lastEntry = task.dateTimeEntry!;
      final int diff = (DateTime.now().difference(lastEntry)).inSeconds;
      _countdown = diff + task.countDown;
      startTimer();
    } else {
      _countdown = task.countDown;
    }
  }

  void updateTask(
    int boardId,
    int cardId,
    int taskId,
    String title,
    String description,
  ) {
    final task = storage.boards[boardId].cards[cardId].tasks[taskId];
    task.isTimerRunning = isTimerRunning;
    task.dateTimeEntry = DateTime.now();
    task.countDown = _countdown;
    task.description = description;
    task.title = title;
    storage.updateStorage();
  }

  void closeTask(
    int boardId,
    int cardId,
    int taskId,
  ) {
    final tasks = storage.boards[boardId].cards[cardId].tasks;
    final completedTask = CompletedTask(
      title: tasks[taskId].title,
      completionDate: DateTime.now(),
      timeSpent: formattedTime(_countdown),
    );
    tasks.removeAt(taskId);
    storage.completedTasks.add(completedTask);
    storage.updateHistory();
  }

  void deleteTask(
      int boardId,
      int cardId,
      int taskId,
      ) {
    storage.boards[boardId].cards[cardId].tasks.removeAt(taskId);
    storage.updateHistory();
  }

  String formattedTime(int countdown) {
    int sec = countdown % 60;
    int min = ((countdown / 60) % 60).floor();
    int hrs = (countdown / 60 / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    String hour = hrs.toString().length <= 1 ? "0$hrs" : "$hrs";
    return "$hour:$minute:$second";
  }
}
