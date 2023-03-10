// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanban_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$KanbanStore on _KanbanStore, Store {
  late final _$itemsAtom = Atom(name: '_KanbanStore.items', context: context);

  @override
  ObservableList<BoardCard> get items {
    _$itemsAtom.reportRead();
    return super.items;
  }

  @override
  set items(ObservableList<BoardCard> value) {
    _$itemsAtom.reportWrite(value, super.items, () {
      super.items = value;
    });
  }

  late final _$_KanbanStoreActionController =
      ActionController(name: '_KanbanStore', context: context);

  @override
  void addColumn({required String title}) {
    final _$actionInfo = _$_KanbanStoreActionController.startAction(
        name: '_KanbanStore.addColumn');
    try {
      return super.addColumn(title: title);
    } finally {
      _$_KanbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void addTask({required int column, required String title}) {
    final _$actionInfo = _$_KanbanStoreActionController.startAction(
        name: '_KanbanStore.addTask');
    try {
      return super.addTask(column: column, title: title);
    } finally {
      _$_KanbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void arrangeTask({required int column, required int from, required int to}) {
    final _$actionInfo = _$_KanbanStoreActionController.startAction(
        name: '_KanbanStore.arrangeTask');
    try {
      return super.arrangeTask(column: column, from: from, to: to);
    } finally {
      _$_KanbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteTask({required int column, required Task task}) {
    final _$actionInfo = _$_KanbanStoreActionController.startAction(
        name: '_KanbanStore.deleteTask');
    try {
      return super.deleteTask(column: column, task: task);
    } finally {
      _$_KanbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void moveTask({required int column, required Relation data}) {
    final _$actionInfo = _$_KanbanStoreActionController.startAction(
        name: '_KanbanStore.moveTask');
    try {
      return super.moveTask(column: column, data: data);
    } finally {
      _$_KanbanStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
items: ${items}
    ''';
  }
}
