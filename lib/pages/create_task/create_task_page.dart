import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/pages/create_board/create_board_page_store.dart';
import 'package:kanban_flutter/pages/kanban/kanban_page_store.dart';
import 'package:kanban_flutter/resources/styles.dart';

class CreateTaskPage extends StatelessWidget {
  final int cardId;
  final KanbanStore boardStore;
  CreateTaskPage({Key? key, required this.cardId, required this.boardStore}) : super(key: key);

  final CreateBoardPageStore pageStore = GetIt.I();
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        boardStore.saveChanges();
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          leadingWidth: 100.w,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 22.w,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: (){
                  context.router.pop();
                },
                child: Text(
                  'Cancel',
                  style: TextStyles.textSize18Weight400.copyWith(
                    color: Palette.white,
                  ),
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 22.w,
              ),
              child: GestureDetector(
                onTap: () {
                  if (pageStore.isCreateButtonActive) {
                    boardStore.addTask(column: cardId, title: controller.text);
                    context.router.pop();
                  }
                },
                child: Center(
                  child: Observer(builder: (context) {
                    return Text(
                      'Save',
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
              height: 32.h,
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
              color: Palette.grey3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextField(
                    controller: controller,
                    style: TextStyles.textSize18Weight400.copyWith(
                      color: Palette.grey7,
                    ),
                    decoration: const InputDecoration(
                      hintText: 'New Task',
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
                  SizedBox(
                    height: 12.w,
                  ),
                  Row(
                    children: [
                      Text(
                        'In list: ',
                        style: TextStyles.textSize16Weight400.copyWith(
                          color: Palette.grey12,
                        ),
                      ),
                      Text(
                        boardStore.items[cardId].title,
                        style: TextStyles.textSize16Weight600.copyWith(
                          color: Palette.grey11,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 32.h,
            ),
          ],
        ),
      ),
    );
  }
}
