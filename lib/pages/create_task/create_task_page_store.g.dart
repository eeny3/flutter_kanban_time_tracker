// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateTaskPageStore on _CreateTaskPageStore, Store {
  late final _$isSaveButtonActiveAtom =
      Atom(name: '_CreateTaskPageStore.isSaveButtonActive', context: context);

  @override
  bool get isSaveButtonActive {
    _$isSaveButtonActiveAtom.reportRead();
    return super.isSaveButtonActive;
  }

  @override
  set isSaveButtonActive(bool value) {
    _$isSaveButtonActiveAtom.reportWrite(value, super.isSaveButtonActive, () {
      super.isSaveButtonActive = value;
    });
  }

  @override
  String toString() {
    return '''
isSaveButtonActive: ${isSaveButtonActive}
    ''';
  }
}
