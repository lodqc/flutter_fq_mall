import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/config/routers.dart';

class NavigatorUtils {
  static Router router;
  static goMallMainPage(BuildContext context) {
    router.navigateTo(context, Routers.home,
        transition: TransitionType.inFromRight, replace: true);
  }
}
