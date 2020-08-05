import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/config/navigator_util.dart';
import 'package:flutter_fq_mall/ui/not_found_view.dart';
import 'package:flutter_fq_mall/ui/splash_view.dart';

class Routers {
  static String root = "/";
  static String home = "/home";

  static void configureRoutes(Router router) {
    NavigatorUtils.router = router;
    router.notFoundHandler = Handler(handlerFunc:
        // ignore: missing_return
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not find");
      return NotFoundView();
    });

    router.define(root, handler: splashHandler);
    router.define(home, handler: splashHandler);
  }
}

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SplashView();
});
