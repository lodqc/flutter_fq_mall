import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/ui/classify_view.dart';
import 'package:flutter_fq_mall/ui/main_view.dart';
import 'file:///D:/fqdemospeace/flutter_fq_mall/lib/model/home_model.dart';
import 'file:///D:/fqdemospeace/flutter_fq_mall/lib/ui/home_view.dart';
import 'package:flutter_fq_mall/ui/not_found_view.dart';
import 'package:provider/provider.dart';

import 'navigator_util.dart';

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
  return ClassifyView();
});
