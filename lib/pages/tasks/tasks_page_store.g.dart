// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tasks_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TasksPageStore on _TasksPageStore, Store {
  late final _$tasksAtom =
      Atom(name: '_TasksPageStore.tasks', context: context);

  @override
  ObservableList<CompletedTask> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<CompletedTask> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$_TasksPageStoreActionController =
      ActionController(name: '_TasksPageStore', context: context);

  @override
  void loadPage() {
    final _$actionInfo = _$_TasksPageStoreActionController.startAction(
        name: '_TasksPageStore.loadPage');
    try {
      return super.loadPage();
    } finally {
      _$_TasksPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
