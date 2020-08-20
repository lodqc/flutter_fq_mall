import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';

import 'routers.dart';

class NavigatorUtils {
  static Router router;
  static BuildContext buildContext;

  static goGoodsListPage(
      BuildContext context,int index) {
    buildContext = context;
    router.navigateTo(
        context,
        Routers.goodsList +
            "?index=$index",
        transition: TransitionType.inFromRight);
  }
}
