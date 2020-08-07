import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'common/config/navigator_util.dart';
import 'common/config/routers.dart';

void main() {
  runApp(MallApp());
}

class MallApp extends StatelessWidget {
  MallApp() {
    Routers.configureRoutes(Router());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: NavigatorUtils.router.generator,
      theme: ThemeData(
        primaryColor: Colors.white,
      ),
      localizationsDelegates: [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],
    );
  }
}
