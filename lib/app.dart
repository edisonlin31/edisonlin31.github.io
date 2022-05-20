import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wholesale/utils/app_text_styles.dart';

import 'router/router.gr.dart';

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  createState() => _App();
}

class _App extends State<App> {
  final _router = AppRouter();

  @override
  void initState() {
    super.initState();
  }

  _getWidget() {
    return MaterialApp.router(
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F6FA),
        primaryColor: Colors.orange,
        colorScheme: ThemeData().colorScheme.copyWith(primary: Colors.orange),
        visualDensity: VisualDensity.adaptivePlatformDensity,
        appBarTheme: AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.white,
          titleTextStyle: AppTextStyles.bold(
            fontSize: 16,
            color: Colors.black,
          ),
          iconTheme: const IconThemeData(color: Colors.orange),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              // minimumSize: const Size.fromHeight(46),
              ),
        ),
      ),
      routerDelegate: _router.delegate(),
      routeInformationParser: _router.defaultRouteParser(),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (defaultTargetPlatform != TargetPlatform.iOS &&
        defaultTargetPlatform != TargetPlatform.android) {
      return Container(
        color: Colors.grey.withOpacity(0.13),
        child: Center(
          child: ClipRRect(
            child: SizedBox(
              width: 600,
              child: _getWidget(),
            ),
          ),
        ),
      );
    }
    return _getWidget();
  }
}
