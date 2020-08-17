import 'dart:convert';

import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';

import 'routers.dart';

class NavigatorUtils {
  static Router router;

  static goGoodsListPage(
      BuildContext context,String categoryId, String data) {
    router.navigateTo(
        context,
        Routers.goodsList +
            "?categoryId=$categoryId&data=$data",
        transition: TransitionType.inFromRight);
  }
}
