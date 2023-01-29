import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:kanban_flutter/data/completed_task/completed_task.dart';
import 'package:kanban_flutter/pages/tasks/tasks_page_store.dart';
import 'package:kanban_flutter/pages/tasks/widgets/export_menu.dart';
import 'package:kanban_flutter/pages/tasks/widgets/task_list_tile.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kanban_flutter/widgets/app_bar_action.dart';
import 'package:kanban_flutter/widgets/page_header.dart';
import 'package:to_csv/to_csv.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({Key? key}) : super(key: key);

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> with TickerProviderStateMixin {
  final TasksPageStore pageStore = TasksPageStore();
  late final AnimationController animationController;
  late final Animation<double> animation;
  double target = 0.0;

  void exportCsv() {
    List<List<String>> csvContent = [];
    List<String> csvHeaders = [];
    csvHeaders.add('Task');
    csvHeaders.add('Completion Date');
    csvHeaders.add('Time spent');
    csvContent.add(csvHeaders);
    for (CompletedTask completedTask in pageStore.storage.completedTasks) {
      List<String> data = [
        completedTask.title,
        DateFormat.MMMMd().format(completedTask.completionDate),
        completedTask.timeSpent,
      ];
      csvContent.add(data);
    }
    if (csvContent.isEmpty) {
      csvContent.add(['']);
    }
    myCSV(csvHeaders, csvContent);
  }

  void _onTapHandler() {
    target += 1;
    if (target > 1.0) {
      target = 1;
      animationController.reset();
    }
    animationController.animateTo(target);
  }

  @override
  void initState() {
    pageStore.loadPage();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    animation =
        Tween<double>(begin: 0, end: pi * 2).animate(animationController);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        actions: [
          AppBarAction(
            icon: Icons.ios_share_outlined,
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => ExportMenu(
                  exportHandler: exportCsv,
                ),
              );
            },
          ),
        ],
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
          itemCount: pageStore.tasks.length + 1,
          itemBuilder: (context, index) {
            return index == 0
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const PageHeader(
                        title: 'My Closed Cards',
                        icon: Icon(
                          Icons.filter_list_outlined,
                          color: Palette.blue,
                        ),
                      ),
                      InkWell(
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(
                            16.w,
                            32.h,
                            16.w,
                            18.h,
                          ),
                          child: GestureDetector(
                            onTap: () {
                              _onTapHandler();
                              pageStore.loadPage();
                            },
                            child: RotationTransition(
                              turns: animation,
                              child: const Icon(
                                Icons.refresh,
                                color: Palette.blue,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : TaskListTile(
                    title: pageStore.tasks[index - 1].title,
                    completionDate: DateFormat.MMMMd()
                        .format(pageStore.tasks[index - 1].completionDate),
                    timeSpent: pageStore.tasks[index - 1].timeSpent,
                  );
          },
        );
      }),
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}
