import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/bean/goods_list_bean.dart';
import 'package:flutter_fq_mall/net/retrofit_client.dart';

class GoodsListModel extends ChangeNotifier {
  GoodsListData data;
  goodsList(String categoryId) {
    RetrofitClient().goodsList(categoryId).then((value) {
      data = value.data;
      notifyListeners();
    });
  }
}
