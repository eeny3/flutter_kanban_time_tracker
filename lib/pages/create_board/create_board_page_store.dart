import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'create_board_page_store.g.dart';

@injectable
class CreateBoardPageStore = _CreateBoardPageStore with _$CreateBoardPageStore;

abstract class _CreateBoardPageStore with Store {
  @observable
  bool isCreateButtonActive = false;
  @observable
  int selectedBackgroundIndex = 0;
}
