import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/data/card/card.dart';
import 'package:kanban_flutter/data/relation/relation.dart';
import 'package:kanban_flutter/data/task/task.dart';
import 'package:kanban_flutter/services/storage/storage.dart';
import 'package:mobx/mobx.dart';

part 'kanban_page_store.g.dart';

class KanbanStore = _KanbanStore with _$KanbanStore;

abstract class _KanbanStore with Store {
  final Board board;

  _KanbanStore({required this.board})
      : items = ObservableList.of(board.cards) {
    for (int i = 0; i < items.length; i++) {
      items[i].tasks = ObservableList.of(board.cards[i].tasks);
    }
  }

  Storage storage = GetIt.I();

  @observable
  ObservableList<BoardCard> items = ObservableList();

  @action
  void addColumn({required String title}) {
    final boardCard = BoardCard(
      title: title,
      tasks: ObservableList.of([]),
    );
    items.add(boardCard);
  }

  @action
  void addTask({
    required int column,
    required String title,
  }) {
    final task = Task(title: title);
    items[column].tasks.add(task);
  }

  @action
  void arrangeTask({
    required int column,
    required int from,
    required int to,
  }) {
    final task = items[column].tasks[from];
    items[column].tasks.remove(task);
    items[column].tasks.insert(to, task);
  }

  @action
  void deleteTask({
    required int column,
    required Task task,
  }) {
    items[column].tasks.remove(task);
  }

  @action
  void moveTask({
    required int column,
    required Relation data,
  }) {
    items[data.from].tasks.remove(data.task);
    items[column].tasks.add(data.task);
  }

  Board saveChanges() {
    final updatedBoard = Board(
      title: board.title,
      cards: items,
      index: board.index,
      backgroundIndex: board.backgroundIndex,
    );
    storage.boards[board.index] = updatedBoard;
    storage.updateStorage();
    return updatedBoard;
  }
}
