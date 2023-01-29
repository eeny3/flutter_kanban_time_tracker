import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:kanban_flutter/pages/choose_background/choose_background_page_store.dart';
import 'package:kanban_flutter/pages/choose_background/wdigets/background_tile.dart';
import 'package:kanban_flutter/pages/create_board/create_board_page_store.dart';
import 'package:kanban_flutter/resources/styles.dart';

class ChooseBackgroundPage extends StatelessWidget {
  final CreateBoardPageStore createBoardPageStore;

  ChooseBackgroundPage({Key? key, required this.createBoardPageStore}) : super(key: key);
  final ChooseBackgroundPageStore pageStore = GetIt.I();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        createBoardPageStore.selectedBackgroundIndex = pageStore.selectedBackgroundIndex;
        return Future(() => true);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Board Background'),
        ),
        body: GridView.count(
          childAspectRatio: 1.5,
          padding: EdgeInsets.all(12.w),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          crossAxisCount: 2,
          children: <Widget>[
            for (int i = 0; i <= 4; i++) ...[
              Observer(builder: (context) {
                return pageStore.selectedBackgroundIndex == i
                    ? Stack(
                        children: [
                          BackgroundTile(
                            imageIndex: i,
                          ),
                          Center(
                            child: Icon(
                              Icons.check,
                              color: Palette.white,
                              size: 44.w,
                            ),
                          ),
                        ],
                      )
                    : InkWell(
                        onTap: () {
                          pageStore.selectBackground(i);
                        },
                        child: BackgroundTile(
                          imageIndex: i,
                        ),
                      );
              }),
            ]
          ],
        ),
      ),
    );
  }
}
