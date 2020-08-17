import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/bean/category_bean.dart';
import 'package:flutter_fq_mall/config/navigator_util.dart';
import 'package:flutter_fq_mall/model/classify_model.dart';
import 'package:flutter_fq_mall/weight/ios_classical_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

/**
 *Author: fuqiang
 *Time: 2020/8/13
 *Description:
 */
class ClassifyView extends StatefulWidget {
  ClassifyView({Key key}) : super(key: key);

  @override
  _ClassifyViewState createState() => _ClassifyViewState();
}

class _ClassifyViewState extends State<ClassifyView> {
  var model;

  @override
  void initState() {
    super.initState();
    model = context.read<ClassifyModel>();
    model.getFirstCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Selector<ClassifyModel, CategoryBean>(
                  builder: (context, bean, _) => ListView.builder(
                        itemBuilder: (context, index) => InkWell(
                          child: Container(
                            height: 192.h,
                            child: Center(
                              child: Text(
                                bean.data[index].name,
                                style: TextStyle(
                                    fontSize: 40.sp, color: Color(0xff666666)),
                              ),
                            ),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1.h,
                                        color: bean.index == index
                                            ? Colors.orange
                                            : Colors.white))),
                          ),
                          onTap: () => model.selectClassiffy(index),
                        ),
                        itemCount: bean == null ? 0 : bean.data.length,
                      ),
                  selector: (context, model) => model.categoryBean),
            ),
            Expanded(
              flex: 4,
              child: SafeArea(
                child: Container(
                  color: Color(0xfff8f8f8),
                  child: EasyRefresh(
                    enableControlFinishRefresh: false,
                    controller: EasyRefreshController(),
                    header: IosClassicalHeader(context: context),
                    onRefresh: () => model.getSecondCategory(),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.w),
                            child: CachedNetworkImage(
                                height: 300.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl: context.select<ClassifyModel, String>(
                                    (value) => value.currentBean == null
                                        ? ""
                                        : value.currentBean.picUrl)),
                          ),
                          Text(
                            context.select<ClassifyModel, String>((value) =>
                                value.currentBean == null
                                    ? ""
                                    : value.currentBean.name),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40.sp, color: Color(0xff666666)),
                          ),
                          Selector<ClassifyModel, CategoryBean>(
                              builder: (context, data, _) => GridView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    gridDelegate:
                                        SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 3,
                                            childAspectRatio: 0.9),
                                    itemBuilder: (context, index) => Card(
                                      child: InkWell(
                                        child: Padding(
                                          padding: EdgeInsets.only(top: 40.h),
                                          child: Column(
                                            children: [
                                              CachedNetworkImage(
                                                  height: 150.h,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                  imageUrl:
                                                      data.data[index].picUrl),
                                              Padding(
                                                  padding: EdgeInsets.only(
                                                      top: 20.h)),
                                              Text(
                                                data.data[index].name,
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    fontSize: 30.sp,
                                                    color: Color(0xff666666)),
                                              ),
                                            ],
                                          ),
                                        ),
                                        onTap: () =>
                                            NavigatorUtils.goGoodsListPage(
                                                context,
                                                data.data[index].id.toString(),json.encode(data.data)),
                                      ),
                                    ),
                                    itemCount:
                                        data == null ? 0 : data.data.length,
                                  ),
                              selector: (context, model) =>
                                  model.secondCategory),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
