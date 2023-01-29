// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_info_page_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskInfoPageStore on _TaskInfoPageStore, Store {
  late final _$isTimerRunningAtom =
      Atom(name: '_TaskInfoPageStore.isTimerRunning', context: context);

  @override
  bool get isTimerRunning {
    _$isTimerRunningAtom.reportRead();
    return super.isTimerRunning;
  }

  @override
  set isTimerRunning(bool value) {
    _$isTimerRunningAtom.reportWrite(value, super.isTimerRunning, () {
      super.isTimerRunning = value;
    });
  }

  late final _$_countdownAtom =
      Atom(name: '_TaskInfoPageStore._countdown', context: context);

  int get countdown {
    _$_countdownAtom.reportRead();
    return super._countdown;
  }

  @override
  int get _countdown => countdown;

  @override
  set _countdown(int value) {
    _$_countdownAtom.reportWrite(value, super._countdown, () {
      super._countdown = value;
    });
  }

  late final _$_TaskInfoPageStoreActionController =
      ActionController(name: '_TaskInfoPageStore', context: context);

  @override
  void _onTick(Timer timer) {
    final _$actionInfo = _$_TaskInfoPageStoreActionController.startAction(
        name: '_TaskInfoPageStore._onTick');
    try {
      return super._onTick(timer);
    } finally {
      _$_TaskInfoPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void startTimer() {
    final _$actionInfo = _$_TaskInfoPageStoreActionController.startAction(
        name: '_TaskInfoPageStore.startTimer');
    try {
      return super.startTimer();
    } finally {
      _$_TaskInfoPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void stopTimer() {
    final _$actionInfo = _$_TaskInfoPageStoreActionController.startAction(
        name: '_TaskInfoPageStore.stopTimer');
    try {
      return super.stopTimer();
    } finally {
      _$_TaskInfoPageStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isTimerRunning: ${isTimerRunning}
    ''';
  }
}
