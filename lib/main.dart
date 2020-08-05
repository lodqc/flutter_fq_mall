import 'dart:io';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_fq_mall/config/navigator_util.dart';
import 'package:flutter_fq_mall/config/routers.dart';

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
    );
  }
}
