// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_board_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateBoardPageStore on _CreateBoardPageStore, Store {
  late final _$isCreateButtonActiveAtom = Atom(
      name: '_CreateBoardPageStore.isCreateButtonActive', context: context);

  @override
  bool get isCreateButtonActive {
    _$isCreateButtonActiveAtom.reportRead();
    return super.isCreateButtonActive;
  }

  @override
  set isCreateButtonActive(bool value) {
    _$isCreateButtonActiveAtom.reportWrite(value, super.isCreateButtonActive,
        () {
      super.isCreateButtonActive = value;
    });
  }

  late final _$selectedBackgroundIndexAtom = Atom(
      name: '_CreateBoardPageStore.selectedBackgroundIndex', context: context);

  @override
  int get selectedBackgroundIndex {
    _$selectedBackgroundIndexAtom.reportRead();
    return super.selectedBackgroundIndex;
  }

  @override
  set selectedBackgroundIndex(int value) {
    _$selectedBackgroundIndexAtom
        .reportWrite(value, super.selectedBackgroundIndex, () {
      super.selectedBackgroundIndex = value;
    });
  }

  @override
  String toString() {
    return '''
isCreateButtonActive: ${isCreateButtonActive},
selectedBackgroundIndex: ${selectedBackgroundIndex}
    ''';
  }
}
