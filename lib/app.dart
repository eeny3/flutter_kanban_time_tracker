import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kanban_flutter/resources/themes.dart';
import 'package:kanban_flutter/routing/app_router.dart';

class App extends StatelessWidget {
  final _router = AppRouter();

  App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(412, 732),
      builder: (context, child) {
        return MaterialApp.router(
          theme: Themes.defaultTheme,
          routerDelegate: _router.delegate(),
          routeInformationParser: _router.defaultRouteParser(),
        );
      },
    );
  }
}
