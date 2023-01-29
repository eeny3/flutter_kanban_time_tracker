import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/services/storage/storage.dart';
import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'board_list_page_store.g.dart';

@injectable
class BoardListPageStore = _BoardListPageStore with _$BoardListPageStore;

abstract class _BoardListPageStore with Store {
  Storage storage = GetIt.I();

  @observable
  ObservableList<Board> boards = ObservableList();

  @action
  void addBoard(Board board) {
    boards.add(board);
    storage.boards.add(board);
    storage.updateStorage();
  }

  @action
  void loadPage() {
    boards = ObservableList<Board>.of(storage.boards);
  }
}
