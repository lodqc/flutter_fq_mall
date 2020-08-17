import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';
import 'package:flutter_fq_mall/bean/goods_list_bean.dart';
import 'package:flutter_fq_mall/model/goods_list_model.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/**
 *Author: fuqiang
 *Time: 2020/8/17
 *Description:
 */
class GoodsListView extends StatefulWidget {
  var categoryId;
  var tabData;

  GoodsListView(this.categoryId, this.tabData, {Key key}) : super(key: key);

  @override
  _GoodsListViewState createState() => _GoodsListViewState();
}

class _GoodsListViewState extends State<GoodsListView>
    with SingleTickerProviderStateMixin {
  GoodsListModel model;
  TabController _tabController; //需要定义一个Controller
  List<CategoryData> tabData;

  @override
  void initState() {
    super.initState();
    tabData = json.decode(widget.tabData);
    // 创建Controller
    _tabController = TabController(length: tabData.length, vsync: this);
    model = context.read<GoodsListModel>();
    model.goodsList(widget.categoryId);
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "商品列表",
          style: TextStyle(
              color: Color(0xff333333),
              fontSize: 50.sp,
              fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        elevation: 0,
        bottom: TabBar(
            //生成Tab菜单
            controller: _tabController,
            isScrollable: true,
            onTap: (index) => model.goodsList(tabData[index].id.toString()),
            tabs: tabData.map((e) => Tab(text: e.name)).toList()),
      ),
      body: TabBarView(
        children: tabData
            .map((e) => Selector<GoodsListModel, List<GoodsListItem>>(
                builder: (context, data, _) => GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) => Card(
                        child: Column(
                          children: <Widget>[
                            CachedNetworkImage(imageUrl: data[index].picUrl),
                            Text(
                              data[index].name,
                              style: TextStyle(
                                  color: Color(0xff333333), fontSize: 30.sp),
                            ),
                            Text(
                              data[index].retailPrice.toString(),
                              style: TextStyle(
                                  color: Colors.deepOrange, fontSize: 30.sp),
                            ),
                          ],
                        ),
                      ),
                      itemCount: data == null ? 0 : data.length,
                    ),
                selector: (context, model) => model.data.list))
            .toList(),
        controller: _tabController,
      ),
    );
  }
}
