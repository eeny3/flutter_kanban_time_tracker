import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:kanban_flutter/pages/board_list/board_list_page_store.dart';
import 'package:kanban_flutter/pages/board_list/widgets/board_tile.dart';
import 'package:kanban_flutter/pages/board_list/widgets/preview.dart';
import 'package:kanban_flutter/resources/images.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kanban_flutter/routing/app_router.dart';
import 'package:kanban_flutter/widgets/app_bar_action.dart';
import 'package:kanban_flutter/widgets/page_header.dart';

class BoardListPage extends StatefulWidget {
  const BoardListPage({Key? key}) : super(key: key);

  @override
  State<BoardListPage> createState() => _BoardListPageState();
}

class _BoardListPageState extends State<BoardListPage> {
  final BoardListPageStore pageStore = BoardListPageStore();

  @override
  void initState() {
    pageStore.loadPage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          AppBarAction(
            icon: Icons.add,
            onTap: () {
              context.router.push(
                CreateBoardRoute(boardListStore: pageStore),
              );
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return ListView.separated(
          itemCount: pageStore.boards.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? const PageHeader(
                    title: 'YOUR BOARDS',
                    icon: Icon(
                      Icons.people_alt_outlined,
                      color: Palette.blue,
                    ),
                  )
                : GestureDetector(
                    onTap: () {
                      context.router.push(
                        KanbanRoute(
                          board: pageStore.boards[index - 1],
                        ),
                      ).then((value) {
                        pageStore.loadPage();
                      });
                    },
                    child: BoardListTile(
                      title: pageStore.boards[index - 1].title,
                      preview: Preview(
                        imagePath: '$images/bc${pageStore.boards[index - 1].backgroundIndex}.jpg',
                      ),
                    ),
                  );
          },
          separatorBuilder: (context, index) => const Divider(
            height: 0,
            thickness: 0.3,
            color: Palette.grey4,
            indent: 50,
          ),
        );
      }),
    );
  }
}
