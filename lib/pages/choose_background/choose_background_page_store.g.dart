// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'choose_background_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChooseBackgroundPageStore on _ChooseBackgroundPageStore, Store {
  late final _$selectedBackgroundIndexAtom = Atom(
      name: '_ChooseBackgroundPageStore.selectedBackgroundIndex',
      context: context);

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

  late final _$_ChooseBackgroundPageStoreActionController =
      ActionController(name: '_ChooseBackgroundPageStore', context: context);

  @override
  void selectBackground(int newBackgroundIndex) {
    final _$actionInfo = _$_ChooseBackgroundPageStoreActionController
        .startAction(name: '_ChooseBackgroundPageStore.selectBackground');
    try {
      return super.selectBackground(newBackgroundIndex);
    } finally {
      _$_ChooseBackgroundPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedBackgroundIndex: ${selectedBackgroundIndex}
    ''';
  }
}
