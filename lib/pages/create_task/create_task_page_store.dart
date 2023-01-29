import 'package:mobx/mobx.dart';
import 'package:injectable/injectable.dart';

part 'create_task_page_store.g.dart';

@injectable
class CreateTaskPageStore = _CreateTaskPageStore with _$CreateTaskPageStore;

abstract class _CreateTaskPageStore with Store {
  @observable
  bool isSaveButtonActive = false;
}