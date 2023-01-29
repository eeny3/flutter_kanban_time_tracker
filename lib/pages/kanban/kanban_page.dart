import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/data/board/board.dart';
import 'package:kanban_flutter/data/relation/relation.dart';
import 'package:kanban_flutter/data/task/task.dart';
import 'package:kanban_flutter/pages/kanban/kanban_page_store.dart';
import 'package:kanban_flutter/pages/kanban/widgets/add_column_button_widget.dart';
import 'package:kanban_flutter/pages/kanban/widgets/add_column_widget.dart';
import 'package:kanban_flutter/pages/kanban/widgets/column_widget.dart';
import 'package:kanban_flutter/resources/images.dart';
import 'package:kanban_flutter/resources/styles.dart';
import 'package:kanban_flutter/routing/app_router.dart';

class KanbanPage extends StatelessWidget {
  final ScrollController _scrollController = ScrollController();
  final KanbanStore store;
  final Board board;

  KanbanPage({super.key, required this.board})
      : store = KanbanStore(board: board);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        store.saveChanges();
        return Future.value(true);
      },
      child: Scaffold(
        backgroundColor: Palette.transparent,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(board.title),
          centerTitle: false,
          backgroundColor: Palette.transparent,
          elevation: 0,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image:
                  AssetImage('$images/bc${board.backgroundIndex}.jpg'),
            ),
          ),
          child: Observer(
            builder: (_) => SafeArea(
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: store.items.length + 1,
                itemBuilder: (context, index) {
                  if (index == store.items.length) {
                    return AddColumnButton(
                      key: UniqueKey(),
                      addColumnAction: () => _showAddColumn(context),
                    );
                  } else {
                    return KanbanColumn(
                      key: UniqueKey(),
                      column: store.items[index],
                      index: index,
                      dragHandler: (Relation data, int currentIndex) =>
                          _handleDrag(data, currentIndex),
                      reorderHandler:
                          (int oldIndex, int newIndex, int columnIndex) =>
                              _handleReOrder(oldIndex, newIndex, columnIndex),
                      addTaskHandler: (int index) =>
                          _showAddTask(context, index),
                      dragListener: (PointerMoveEvent event) =>
                          _dragListener(context, event),
                      deleteItemHandler: (int index, Task task) =>
                          _deleteItem(index, task),
                      boardId: board.index,
                    );
                  }
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _dragListener(BuildContext context, PointerMoveEvent event) {
    if (event.position.dx > MediaQuery.of(context).size.width - 20.w) {
      _scrollController.jumpTo(_scrollController.offset + 10.w);
    } else if (event.position.dx < 20.w) {
      _scrollController.jumpTo(_scrollController.offset - 10.w);
    }
  }

  void _showAddColumn(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => AddColumn(
        addColumnHandler: (String title) {
          store.addColumn(title: title);
        },
      ),
    );
  }

  void _showAddTask(BuildContext context, int index) {
    context.router.push(
      CreateTaskRoute(
        cardId: index,
        boardStore: store,
      ),
    );
  }

  void _deleteItem(int columnIndex, Task task) {
    store.deleteTask(column: columnIndex, task: task);
  }

  void _handleReOrder(int oldIndex, int newIndex, int index) {
    if (oldIndex != newIndex) {
      store.arrangeTask(column: index, from: oldIndex, to: newIndex);
    }
  }

  void _handleDrag(Relation data, int currentIndex) {
    store.moveTask(column: currentIndex, data: data);
  }
}
