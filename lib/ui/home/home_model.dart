import 'package:color_thief_flutter/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
import 'package:flutter_fq_mall/common/net/retrofit_client.dart';
import 'package:color_thief_flutter/color_thief_flutter.dart';
class HomeModel extends ChangeNotifier {
  HomeData data = HomeData();
  var swiperColor = Colors.white;

  homeIndex() {
    RetrofitClient().homeIndex().then((value){
      data = value.data;
      notifyListeners();
    });
  }

  void getSwiperColor(String url) {
    getColorFromUrl(url).then((colors) {
      swiperColor = Color.fromARGB(255, colors[0], colors[1], colors[2]);
      notifyListeners();
    });
  }
}
