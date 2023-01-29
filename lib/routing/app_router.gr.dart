// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    MainRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
    CreateBoardRoute.name: (routeData) {
      final args = routeData.argsAs<CreateBoardRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CreateBoardPage(
          key: args.key,
          boardListStore: args.boardListStore,
        ),
      );
    },
    ChooseBackgroundRoute.name: (routeData) {
      final args = routeData.argsAs<ChooseBackgroundRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: ChooseBackgroundPage(
          key: args.key,
          createBoardPageStore: args.createBoardPageStore,
        ),
      );
    },
    KanbanRoute.name: (routeData) {
      final args = routeData.argsAs<KanbanRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: KanbanPage(
          key: args.key,
          board: args.board,
        ),
      );
    },
    CreateTaskRoute.name: (routeData) {
      final args = routeData.argsAs<CreateTaskRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: CreateTaskPage(
          key: args.key,
          cardId: args.cardId,
          boardStore: args.boardStore,
        ),
      );
    },
    TaskInfoRoute.name: (routeData) {
      final args = routeData.argsAs<TaskInfoRouteArgs>();
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: TaskInfoPage(
          key: args.key,
          boardId: args.boardId,
          cardId: args.cardId,
          taskId: args.taskId,
          title: args.title,
          description: args.description,
          inList: args.inList,
        ),
      );
    },
    BoardListRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const BoardListPage(),
      );
    },
    TasksRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
        routeData: routeData,
        child: const TasksPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          MainRoute.name,
          path: '/',
          children: [
            RouteConfig(
              BoardListRoute.name,
              path: 'board-list-page',
              parent: MainRoute.name,
            ),
            RouteConfig(
              TasksRoute.name,
              path: 'tasks-page',
              parent: MainRoute.name,
            ),
          ],
        ),
        RouteConfig(
          CreateBoardRoute.name,
          path: '/create-board-page',
        ),
        RouteConfig(
          ChooseBackgroundRoute.name,
          path: '/choose-background-page',
        ),
        RouteConfig(
          KanbanRoute.name,
          path: '/kanban-page',
        ),
        RouteConfig(
          CreateTaskRoute.name,
          path: '/create-task-page',
        ),
        RouteConfig(
          TaskInfoRoute.name,
          path: '/task-info-page',
        ),
      ];
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          path: '/',
          initialChildren: children,
        );

  static const String name = 'MainRoute';
}

/// generated route for
/// [CreateBoardPage]
class CreateBoardRoute extends PageRouteInfo<CreateBoardRouteArgs> {
  CreateBoardRoute({
    Key? key,
    required BoardListPageStore boardListStore,
  }) : super(
          CreateBoardRoute.name,
          path: '/create-board-page',
          args: CreateBoardRouteArgs(
            key: key,
            boardListStore: boardListStore,
          ),
        );

  static const String name = 'CreateBoardRoute';
}

class CreateBoardRouteArgs {
  const CreateBoardRouteArgs({
    this.key,
    required this.boardListStore,
  });

  final Key? key;

  final BoardListPageStore boardListStore;

  @override
  String toString() {
    return 'CreateBoardRouteArgs{key: $key, boardListStore: $boardListStore}';
  }
}

/// generated route for
/// [ChooseBackgroundPage]
class ChooseBackgroundRoute extends PageRouteInfo<ChooseBackgroundRouteArgs> {
  ChooseBackgroundRoute({
    Key? key,
    required CreateBoardPageStore createBoardPageStore,
  }) : super(
          ChooseBackgroundRoute.name,
          path: '/choose-background-page',
          args: ChooseBackgroundRouteArgs(
            key: key,
            createBoardPageStore: createBoardPageStore,
          ),
        );

  static const String name = 'ChooseBackgroundRoute';
}

class ChooseBackgroundRouteArgs {
  const ChooseBackgroundRouteArgs({
    this.key,
    required this.createBoardPageStore,
  });

  final Key? key;

  final CreateBoardPageStore createBoardPageStore;

  @override
  String toString() {
    return 'ChooseBackgroundRouteArgs{key: $key, createBoardPageStore: $createBoardPageStore}';
  }
}

/// generated route for
/// [KanbanPage]
class KanbanRoute extends PageRouteInfo<KanbanRouteArgs> {
  KanbanRoute({
    Key? key,
    required Board board,
  }) : super(
          KanbanRoute.name,
          path: '/kanban-page',
          args: KanbanRouteArgs(
            key: key,
            board: board,
          ),
        );

  static const String name = 'KanbanRoute';
}

class KanbanRouteArgs {
  const KanbanRouteArgs({
    this.key,
    required this.board,
  });

  final Key? key;

  final Board board;

  @override
  String toString() {
    return 'KanbanRouteArgs{key: $key, board: $board}';
  }
}

/// generated route for
/// [CreateTaskPage]
class CreateTaskRoute extends PageRouteInfo<CreateTaskRouteArgs> {
  CreateTaskRoute({
    Key? key,
    required int cardId,
    required KanbanStore boardStore,
  }) : super(
          CreateTaskRoute.name,
          path: '/create-task-page',
          args: CreateTaskRouteArgs(
            key: key,
            cardId: cardId,
            boardStore: boardStore,
          ),
        );

  static const String name = 'CreateTaskRoute';
}

class CreateTaskRouteArgs {
  const CreateTaskRouteArgs({
    this.key,
    required this.cardId,
    required this.boardStore,
  });

  final Key? key;

  final int cardId;

  final KanbanStore boardStore;

  @override
  String toString() {
    return 'CreateTaskRouteArgs{key: $key, cardId: $cardId, boardStore: $boardStore}';
  }
}

/// generated route for
/// [TaskInfoPage]
class TaskInfoRoute extends PageRouteInfo<TaskInfoRouteArgs> {
  TaskInfoRoute({
    Key? key,
    required int boardId,
    required int cardId,
    required int taskId,
    required String title,
    required String description,
    required String inList,
  }) : super(
          TaskInfoRoute.name,
          path: '/task-info-page',
          args: TaskInfoRouteArgs(
            key: key,
            boardId: boardId,
            cardId: cardId,
            taskId: taskId,
            title: title,
            description: description,
            inList: inList,
          ),
        );

  static const String name = 'TaskInfoRoute';
}

class TaskInfoRouteArgs {
  const TaskInfoRouteArgs({
    this.key,
    required this.boardId,
    required this.cardId,
    required this.taskId,
    required this.title,
    required this.description,
    required this.inList,
  });

  final Key? key;

  final int boardId;

  final int cardId;

  final int taskId;

  final String title;

  final String description;

  final String inList;

  @override
  String toString() {
    return 'TaskInfoRouteArgs{key: $key, boardId: $boardId, cardId: $cardId, taskId: $taskId, title: $title, description: $description, inList: $inList}';
  }
}

/// generated route for
/// [BoardListPage]
class BoardListRoute extends PageRouteInfo<void> {
  const BoardListRoute()
      : super(
          BoardListRoute.name,
          path: 'board-list-page',
        );

  static const String name = 'BoardListRoute';
}

/// generated route for
/// [TasksPage]
class TasksRoute extends PageRouteInfo<void> {
  const TasksRoute()
      : super(
          TasksRoute.name,
          path: 'tasks-page',
        );

  static const String name = 'TasksRoute';
}
