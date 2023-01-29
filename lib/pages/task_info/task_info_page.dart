import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/pages/task_info/task_info_page_store.dart';
import 'package:kanban_flutter/pages/task_info/widgets/custom_textfield.dart';
import 'package:kanban_flutter/resources/styles.dart';

class TaskInfoPage extends StatefulWidget {
  final int boardId;
  final int cardId;
  final int taskId;
  final String title;
  final String description;
  final String inList;

  const TaskInfoPage({
    Key? key,
    required this.boardId,
    required this.cardId,
    required this.taskId,
    required this.title,
    required this.description,
    required this.inList,
  }) : super(key: key);

  @override
  State<TaskInfoPage> createState() => _TaskInfoPageState();
}

class _TaskInfoPageState extends State<TaskInfoPage> {
  late final TextEditingController titleController;

  late final TextEditingController descriptionController;

  final TaskInfoPageStore pageStore = TaskInfoPageStore();

  @override
  void initState() {
    titleController = TextEditingController(text: widget.title);
    descriptionController = TextEditingController(text: widget.description);
    pageStore.loadTask(widget.boardId, widget.cardId, widget.taskId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () {
        if(pageStore.canUpdateTask) {
          pageStore.updateTask(
            widget.boardId,
            widget.cardId,
            widget.taskId,
            titleController.text,
            descriptionController.text,
          );
        }
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Palette.grey3,
        appBar: AppBar(
          backgroundColor: Palette.grey3,
          leading: Padding(
            padding: EdgeInsets.only(
              left: 22.w,
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: GestureDetector(
                onTap: () {
                  context.router.pop();
                },
                child: const Icon(
                  Icons.close,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.only(
                right: 22.w,
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                  onTap: () {
                    pageStore.deleteTask(
                      widget.boardId,
                      widget.cardId,
                      widget.taskId,
                    );
                    pageStore.canUpdateTask = false;
                    context.router.pop();
                  },
                  child: const Icon(
                    Icons.delete_outlined,
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            width: width,
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomTextField(
                  controller: titleController,
                  footerTitle: widget.inList,
                ),
                SizedBox(
                  height: 24.h,
                ),
                Center(
                  child: Column(
                    children: [
                      Observer(builder: (context) {
                        return Text(
                          pageStore.formattedTime(pageStore.countdown),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.textSize48Weight400.copyWith(
                            color: Palette.white,
                          ),
                        );
                      }),
                      SizedBox(
                        height: 18.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (pageStore.isTimerRunning) {
                            pageStore.stopTimer();
                          } else {
                            pageStore.startTimer();
                          }
                        },
                        child: Observer(builder: (context) {
                          return pageStore.isTimerRunning
                              ? Text(
                                  'Stop timer',
                                  style:
                                      TextStyles.textSize16Weight400.copyWith(
                                    color: Palette.pink,
                                  ),
                                )
                              : Text(
                                  'Start timer',
                                  style:
                                      TextStyles.textSize16Weight400.copyWith(
                                    color: Palette.blue2,
                                  ),
                                );
                        }),
                      ),
                      SizedBox(
                        height: 12.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          pageStore.closeTask(
                            widget.boardId,
                            widget.cardId,
                            widget.taskId,
                          );
                          pageStore.canUpdateTask = false;
                          context.router.pop();
                        },
                        child: Text(
                          'Close Task  ✓',
                          style: TextStyles.textSize16Weight400.copyWith(
                            color: Palette.green,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Expanded(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 12.w, vertical: 14.h),
                    color: Palette.grey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          Icons.menu,
                          color: Palette.white,
                        ),
                        TextField(
                          controller: descriptionController,
                          maxLines: 10,
                          style: TextStyles.textSize18Weight500.copyWith(
                            color: Palette.white,
                          ),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
