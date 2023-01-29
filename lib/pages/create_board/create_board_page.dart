import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/pages/board_list/board_list_page_store.dart';
import 'package:kanban_flutter/pages/create_board/create_board_page_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kanban_flutter/resources/images.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:kanban_flutter/routing/app_router.dart';

class CreateBoardPage extends StatefulWidget {
  final BoardListPageStore boardListStore;

  const CreateBoardPage({Key? key, required this.boardListStore})
      : super(key: key);

  @override
  State<CreateBoardPage> createState() => _CreateBoardPageState();
}

class _CreateBoardPageState extends State<CreateBoardPage> {
  final CreateBoardPageStore pageStore = GetIt.I();

  TextEditingController controller = TextEditingController();

  void createBoard(){
    if (pageStore.isCreateButtonActive) {
      final newBoard = Board(
        title: controller.text,
        cards: [],
        index: widget.boardListStore.boards.length,
        backgroundIndex: pageStore.selectedBackgroundIndex,
      );
      widget.boardListStore.addBoard(newBoard);
      context.router.popAndPush(
        KanbanRoute(board: widget.boardListStore.boards.last),
      ).then((value) {
        widget.boardListStore.loadPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Board'),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 22.w,
            ),
            child: GestureDetector(
              onTap: createBoard,
              child: Center(
                child: Observer(builder: (context) {
                  return Text(
                    'Create',
                    style: TextStyles.textSize18Weight600.copyWith(
                      color: pageStore.isCreateButtonActive
                          ? Palette.white
                          : Palette.grey5,
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 55.h,
          ),
          const Divider(
            height: 0,
            thickness: 0.3,
            color: Palette.grey4,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
            ),
            child: TextField(
              controller: controller,
              style: TextStyles.textSize18Weight400.copyWith(
                color: Palette.grey7,
              ),
              decoration: const InputDecoration(
                hintText: 'New Board',
                hintStyle: TextStyle(
                  color: Palette.grey6,
                ),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                if (controller.text.isNotEmpty) {
                  pageStore.isCreateButtonActive = true;
                } else {
                  pageStore.isCreateButtonActive = false;
                }
              },
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0.3,
            color: Palette.grey4,
          ),
          SizedBox(
            height: 49.h,
          ),
          const Divider(
            height: 0,
            thickness: 0.3,
            color: Palette.grey4,
          ),
          InkWell(
            highlightColor: Palette.darkBlue,
            onTap: () {
              context.router.push(
                ChooseBackgroundRoute(
                  createBoardPageStore: pageStore,
                ),
              );
            },
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 16.w,
                vertical: 16.h,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Background',
                    style: TextStyles.textSize18Weight400.copyWith(
                      color: Palette.white,
                    ),
                  ),
                  Row(
                    children: [
                      Observer(
                        builder: (context) {
                          return Container(
                            height: 22.w,
                            width: 22.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(4.r),
                              ),
                              image: DecorationImage(
                                image: AssetImage(
                                    '$images/bc${pageStore.selectedBackgroundIndex}.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                          );
                        }
                      ),
                      SizedBox(
                        width: 6.w,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Palette.grey8,
                        size: 16.w,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            height: 0,
            thickness: 0.3,
            color: Palette.grey4,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
