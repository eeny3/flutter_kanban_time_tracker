import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'choose_background_page_store.g.dart';

@injectable
class ChooseBackgroundPageStore = _ChooseBackgroundPageStore
    with _$ChooseBackgroundPageStore;

abstract class _ChooseBackgroundPageStore with Store {
  @observable
  int selectedBackgroundIndex = 0;

  @action
  void selectBackground(int newBackgroundIndex) {
    selectedBackgroundIndex = newBackgroundIndex;
  }
}
