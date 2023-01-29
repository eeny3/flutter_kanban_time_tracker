import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kanban_flutter/pages/board_list/board_list_page.dart';
import 'package:kanban_flutter/pages/choose_background/choose_background_page.dart';
import 'package:kanban_flutter/pages/create_board/create_board_page.dart';
import 'package:kanban_flutter/pages/create_task/create_task_page.dart';
import 'package:kanban_flutter/pages/kanban/kanban_page.dart';
import 'package:kanban_flutter/pages/main/main_page.dart';
import 'package:kanban_flutter/pages/task_info/task_info_page.dart';
import 'package:kanban_flutter/pages/tasks/tasks_page.dart';
import 'package:kanban_flutter/pages/board_list/board_list_page_store.dart';
import 'package:kanban_flutter/pages/kanban/kanban_page_store.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/pages/create_board/create_board_page_store.dart';

part 'app_router.gr.dart';
part 'app_router.helpers.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      initial: true,
      page: MainPage,
      children: [
        AutoRoute(
          page: BoardListPage,
        ),
        AutoRoute(
          page: TasksPage,
        ),
      ],
    ),
    AutoRoute(page: CreateBoardPage),
    AutoRoute(page: ChooseBackgroundPage),
    AutoRoute(page: KanbanPage),
    AutoRoute(page: CreateTaskPage),
    AutoRoute(page: TaskInfoPage),
  ],
)
class AppRouter extends _$AppRouter {
  AppRouter() : super();
}
