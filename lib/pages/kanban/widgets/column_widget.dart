import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/data/card/card.dart';
import 'package:kanban_flutter/data/relation/relation.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:kanban_flutter/routing/app_router.dart';

import 'task_card_widget.dart';

class KanbanColumn extends StatefulWidget {
  final BoardCard column;
  final int index;
  final Function dragHandler;
  final Function reorderHandler;
  final Function addTaskHandler;
  final Function dragListener;
  final Function deleteItemHandler;
  final int boardId;

  const KanbanColumn({
    super.key,
    required this.column,
    required this.index,
    required this.dragHandler,
    required this.reorderHandler,
    required this.addTaskHandler,
    required this.dragListener,
    required this.deleteItemHandler,
    required this.boardId,
  });

  @override
  State<KanbanColumn> createState() => _KanbanColumnState();
}

class _KanbanColumnState extends State<KanbanColumn> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Observer(
      builder: (_) => Stack(
        children: <Widget>[
          Container(
            width: (width - 150).w,
            decoration: BoxDecoration(
              color: Palette.grey3,
              borderRadius: BorderRadius.circular(6.0.r),
            ),
            margin: EdgeInsets.fromLTRB(16.w, 32.h, 16.w, 100.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.w, vertical: 16.h),
                  child: Text(
                    widget.column.title,
                    style: TextStyles.textSize14Weight400.copyWith(
                      color: Palette.white,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: [
                      for (final task in widget.column.tasks)
                        GestureDetector(
                          onTap: () {
                            context.router.push(
                              TaskInfoRoute(
                                boardId: widget.boardId,
                                cardId: widget.index,
                                taskId: widget.column.tasks.indexOf(task),
                                title: task.title,
                                description: task.description,
                                inList: widget.column.title,
                              ),
                            ).then((value) {
                              //TODO rebuild column without setState
                              setState(() {

                              });
                            });
                          },
                          child: TaskCard(
                            key: ValueKey(task),
                            task: task,
                            columnIndex: widget.index,
                            deleteItemHandler: widget.deleteItemHandler,
                            dragListener: widget.dragListener,
                          ),
                        )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    widget.addTaskHandler(widget.index);
                  },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(
                      10.w,
                      18.h,
                      10.w,
                      16.h,
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.add,
                          size: 14.sp,
                          color: Palette.grey10,
                        ),
                        SizedBox(
                          width: 6.w,
                        ),
                        Text(
                          'Add card',
                          style: TextStyles.textSize14Weight500.copyWith(
                            color: Palette.grey10,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: DragTarget<Relation>(
              onWillAccept: (data) {
                return true;
              },
              onLeave: (data) {},
              onAccept: (data) {
                if (data.from == widget.index) {
                  return;
                }
                widget.dragHandler(data, widget.index);
              },
              builder: (context, accept, reject) {
                return Container();
              },
            ),
          ),
        ],
      ),
    );
  }
}
