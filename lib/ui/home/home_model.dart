import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
import 'package:flutter_fq_mall/common/net/retrofit_client.dart';
import 'package:color_thief_flutter/color_thief_flutter.dart';

class HomeModel extends ChangeNotifier {
  HomeData data = HomeData();
  List<Color> allColors = List();
  int index = -1;
  EasyRefreshController controller = EasyRefreshController();
  homeIndex() {
    RetrofitClient().homeIndex().then((value) {
      data = value.data;
      data.banner.forEach((e) => getColorFromUrl(e.url).then((colors) =>
          allColors.add(Color.fromARGB(255, colors[0], colors[1], colors[2]))));
      controller.resetLoadState();
      notifyListeners();
    });
  }

  bannerChange(int index) {
    this.index = index;
    if(allColors.isNotEmpty&&allColors.length>index){
      notifyListeners();
    }
  }
}
