import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'common/config/navigator_util.dart';
import 'common/config/routers.dart';
import 'generated/i18n.dart';

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
        platform: TargetPlatform.iOS
      ),
      localizationsDelegates: [
        S.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: S.delegate.supportedLocales,
      localeResolutionCallback: S.delegate.resolution(),
    );
  }
}
