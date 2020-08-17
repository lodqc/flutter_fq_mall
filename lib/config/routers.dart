import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/model/goods_list_model.dart';
import 'package:flutter_fq_mall/ui/goods_list_view.dart';
import 'package:flutter_fq_mall/ui/main_view.dart';
import 'package:flutter_fq_mall/ui/not_found_view.dart';
import 'package:provider/provider.dart';

import 'navigator_util.dart';

class Routers {
  static String root = "/";
  static String goodsList = "/goodsList";

  static void configureRoutes(Router router) {
    NavigatorUtils.router = router;
    router.notFoundHandler = Handler(handlerFunc:
        // ignore: missing_return
        (BuildContext context, Map<String, List<String>> parameters) {
      print("handler not find");
      return NotFoundView();
    });

    router.define(root, handler: mainHandler);
    router.define(goodsList, handler: goodsListHandler);
  }
}

var mainHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MainView();
});

var goodsListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return ChangeNotifierProvider<GoodsListModel>(
    create: (context) => GoodsListModel(),
    child: GoodsListView(parameters["categoryId"].first,parameters["data"].first),
  );
});
