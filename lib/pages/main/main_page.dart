import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:kanban_flutter/routing/app_router.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:kanban_flutter/services/storage/storage.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _box = Hive.box('kanban_panel');
  Storage storage = GetIt.I();

  @override
  void initState() {
    if(_box.get('boards') == null){
      storage.createInitialData();
    } else {
      storage.loadData();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: const [
        BoardListRoute(),
        TasksRoute(),
      ],
      builder: (context, child, animation) {
        final tabsRouter = AutoTabsRouter.of(context);

        return Scaffold(
          backgroundColor: Palette.black,
          body: child,
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                  color: Palette.white,
                  width: 0.1,
                ),
              ),
            ),
            child: BottomNavigationBar(
              selectedFontSize: 0,
              currentIndex: tabsRouter.activeIndex,
              onTap: (index) {
                tabsRouter.setActiveIndex(index);
              },
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.developer_board,
                    size: 32,
                  ),
                  label: 'board',
                ),
                BottomNavigationBarItem(
                  icon: Icon(
                    Icons.task,
                    size: 32,
                  ),
                  label: 'tasks',
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
