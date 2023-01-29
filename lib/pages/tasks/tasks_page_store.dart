import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/data/completed_task/completed_task.dart';
import 'package:kanban_flutter/services/storage/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'tasks_page_store.g.dart';

@injectable
class TasksPageStore = _TasksPageStore with _$TasksPageStore;

abstract class _TasksPageStore with Store {
  Storage storage = GetIt.I();

  @observable
  ObservableList<CompletedTask> tasks = ObservableList();

  @action
  void loadPage() {
    storage.loadTaskHistory();
    tasks = ObservableList<CompletedTask>.of(storage.completedTasks);
  }
}