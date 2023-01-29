// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'board_list_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BoardListPageStore on _BoardListPageStore, Store {
  late final _$boardsAtom =
      Atom(name: '_BoardListPageStore.boards', context: context);

  @override
  ObservableList<Board> get boards {
    _$boardsAtom.reportRead();
    return super.boards;
  }

  @override
  set boards(ObservableList<Board> value) {
    _$boardsAtom.reportWrite(value, super.boards, () {
      super.boards = value;
    });
  }

  late final _$_BoardListPageStoreActionController =
      ActionController(name: '_BoardListPageStore', context: context);

  @override
  void addBoard(Board board) {
    final _$actionInfo = _$_BoardListPageStoreActionController.startAction(
        name: '_BoardListPageStore.addBoard');
    try {
      return super.addBoard(board);
    } finally {
      _$_BoardListPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loadPage() {
    final _$actionInfo = _$_BoardListPageStoreActionController.startAction(
        name: '_BoardListPageStore.loadPage');
    try {
      return super.loadPage();
    } finally {
      _$_BoardListPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
boards: ${boards}
    ''';
  }
}
