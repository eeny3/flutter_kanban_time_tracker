// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/board/board.dart' as _i3;
import '../data/card/card.dart' as _i4;
import '../pages/board_list/board_list_page_store.dart' as _i5;
import '../pages/choose_background/choose_background_page_store.dart' as _i6;
import '../pages/create_board/create_board_page_store.dart' as _i7;
import '../pages/create_task/create_task_page_store.dart' as _i8;
import '../pages/task_info/task_info_page_store.dart' as _i10;
import '../pages/tasks/tasks_page_store.dart' as _i11;
import '../services/storage/storage.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(
  _i1.GetIt get, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    get,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.Board>(() => _i3.Board(
        title: get<String>(),
        cards: get<List<_i4.BoardCard>>(),
        index: get<int>(),
        backgroundIndex: get<int>(),
      ));
  gh.factory<_i5.BoardListPageStore>(() => _i5.BoardListPageStore());
  gh.factory<_i6.ChooseBackgroundPageStore>(
      () => _i6.ChooseBackgroundPageStore());
  gh.factory<_i7.CreateBoardPageStore>(() => _i7.CreateBoardPageStore());
  gh.factory<_i8.CreateTaskPageStore>(() => _i8.CreateTaskPageStore());
  gh.lazySingleton<_i9.Storage>(() => _i9.Storage());
  gh.factory<_i10.TaskInfoPageStore>(() => _i10.TaskInfoPageStore());
  gh.factory<_i11.TasksPageStore>(() => _i11.TasksPageStore());
  return get;
}
