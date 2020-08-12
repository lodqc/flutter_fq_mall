import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
import 'package:flutter_fq_mall/common/constant/string.dart';
import 'package:flutter_fq_mall/common/weight/ios_classical_header.dart';
import 'package:flutter_fq_mall/common/weight/sliver_custom_header_delegate.dart';
import 'package:flutter_fq_mall/ui/home/home_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 *Author: fuqiang
 *Time: 2020/8/6
 *Description:
 */
class HomeView extends StatefulWidget {
  HomeView({Key key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  HomeModel model;

  @override
  void initState() {
    super.initState();
    model = context.read<HomeModel>();
    model.homeIndex();
  }

  // 无限加载
  bool _enableInfiniteLoad = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
//        enableControlFinishLoad: true,
        controller: model.controller,
        header: IosClassicalHeader(context: context),
//        footer: ClassicalFooter(
//          enableInfiniteLoad: _enableInfiniteLoad,
//          enableHapticFeedback: _vibration,
//          loadText: S.of(context).pushToLoad,
//          loadReadyText: S.of(context).releaseToLoad,
//          loadingText: S.of(context).loading,
//          loadedText: S.of(context).loaded,
//          loadFailedText: S.of(context).loadFailed,
//          noMoreText: S.of(context).noMore,
//          infoText: S.of(context).updateAt,
//        ),
        onRefresh: () async {
          model.homeIndex();
        },
//        onLoad: () async {
//          await Future.delayed(Duration(seconds: 2), () {
//            print('onLoad');
//            _controller.finishLoad(noMore: true);
//          });
//        },
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                collapsedHeight: 200.h,
                expandedHeight: 560.h,
                child: _getBannerSelector()),
          ),
          _getChannelSelector(),
          _getTtile(Strings.COUPON_AREA),
          _getCouponSelector(),
          _getTtile(Strings.GROUP_BUG),
          _getGrouponSelector(),
          _getTtile(Strings.BRAND),
          _getBrandSelector(),
          _getTtile(Strings.NEW_PRODUCT),
          _getGoodsSelector<HomeNewGoodsList>(),
          _getTtile(Strings.PROJECT_SELECTIONS),
          _getTopicSelector(),
          _getTtile(Strings.HOT_PRODUCT),
          _getGoodsSelector<HomeHotGoodsList>(),
          _getFloorGoodsSelector(),
        ],
      ),
    );
  }

  Selector<HomeModel, List<HomeFloorGoodsList>> _getFloorGoodsSelector() {
    return Selector<HomeModel, List<HomeFloorGoodsList>>(
        builder: (context, data, _) => SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => Column(
                      children: [
                        Container(
                          height: 40.0,
                          alignment: Alignment.center,
                          child: Text(data[index].name),
                        ),
                        GridView.builder(
                          shrinkWrap: true,
                          itemCount: data[index].goodsList.length,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2, childAspectRatio: 0.90),
                          itemBuilder: (BuildContext context, int gridIndex) =>
                              Container(
                            child: InkWell(
                              onTap: () => print("object"),
                              child: Card(
                                elevation: 2.0,
                                margin: EdgeInsets.all(6.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: <Widget>[
                                    Container(
                                        margin: EdgeInsets.all(5.0),
                                        child: CachedNetworkImage(
                                          width: 250.w,
                                          height: 250.w,
                                          imageUrl: data[index]
                                              .goodsList[gridIndex]
                                              .picUrl,
                                        )),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 4.0, top: 4.0),
                                      child: Text(
                                        data[index].goodsList[gridIndex].name,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 14.0),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(top: 4.0),
                                    ),
                                    Container(
                                      padding:
                                          EdgeInsets.only(left: 4.0, top: 4.0),
                                      alignment: Alignment.center,
                                      child: Text(
                                        "￥${data[index].goodsList[gridIndex].retailPrice}",
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 12.0),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                childCount: data == null ? 0 : data.length)),
        selector: (context, model) => model.data.floorGoodsList);
  }

  SliverToBoxAdapter _getTtile(String title) {
    return SliverToBoxAdapter(
      child: Container(
        height: 40.0,
        alignment: Alignment.center,
        child: Text(title),
      ),
    );
  }

  Selector<HomeModel, List<HomeTopicList>> _getTopicSelector() {
    return Selector<HomeModel, List<HomeTopicList>>(
        builder: (context, data, _) => SliverToBoxAdapter(
              child: Container(
                height: 500.h,
                child: ListView.builder(
                    itemCount: data == null ? 0 : data.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context, int index) => Container(
                          width: 900.w,
                          child: Card(
                            child: InkWell(
                              onTap: () => print("object"),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl: data[index].picUrl,
                                      width: 800.w,
                                      height: 260.h,
                                    ),
                                  ),
                                  Padding(padding: EdgeInsets.only(top: 10.h)),
                                  Container(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        data[index].title,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 30.sp),
                                      )),
                                  Padding(padding: EdgeInsets.only(top: 6.h)),
                                  Container(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        data[index].subtitle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 30.sp),
                                      )),
                                  Padding(padding: EdgeInsets.only(top: 6.h)),
                                  Container(
                                      padding: EdgeInsets.only(left: 10.h),
                                      child: Text(
                                        Strings.DOLLAR + "${data[index].price}",
                                        style: TextStyle(
                                            color: Colors.deepOrangeAccent,
                                            fontSize: 30.sp),
                                      )),
                                ],
                              ),
                            ),
                          ),
                        )),
              ),
            ),
        selector: (context, model) => model.data.topicList);
  }

  Selector<HomeModel, List<HomeCouponList>> _getCouponSelector() {
    return Selector<HomeModel, List<HomeCouponList>>(
        builder: (context, data, _) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                    child: InkWell(
                  onTap: () => print("object"),
                  child: Card(
                    margin: EdgeInsets.all(20.w),
                    child: Row(
                      children: <Widget>[
                        Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          child: Text(
                            "${data[index].discount}元",
                            style:
                                TextStyle(fontSize: 50.sp, color: Colors.grey),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                        ),
                        Expanded(
                          child: Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 20.w),
                                ),
                                Text(data[index].name),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.w),
                                ),
                                Text("满${data[index].min}使用"),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.w),
                                ),
                                Text("有效期${data[index].days}天"),
                                Padding(
                                  padding: EdgeInsets.only(top: 20.w),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )),
                childCount: data == null ? 0 : data.length,
              ),
            ),
        selector: (context, model) => model.data.couponList);
  }

  Selector<HomeModel, List<HomeGrouponList>> _getGrouponSelector() {
    return Selector<HomeModel, List<HomeGrouponList>>(
        builder: (context, data, _) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Container(
                  height: 250.h,
                  child: Card(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        CachedNetworkImage(
                          width: 250.w,
                          height: 250.w,
                          imageUrl: data[index].picUrl,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 20.w,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              data[index].name,
                              style: TextStyle(
                                  fontSize: 30.sp, color: Colors.black87),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.w),
                            ),
                            Text(
                              data[index].brief,
                              style: TextStyle(
                                  fontSize: 30.sp, color: Colors.black54),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.w),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "原价${data[index].retailPrice}",
                                  style: TextStyle(
                                      fontSize: 28.sp,
                                      color: Colors.grey[850],
                                      decoration: TextDecoration.lineThrough,
                                      decorationStyle:
                                          TextDecorationStyle.dashed),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                ),
                                Text(
                                  "现价${data[index].retailPrice}",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 28.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Expanded(
                            child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 60.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.deepOrangeAccent,
                                      width: 0.5),
                                  // 边色与边宽度
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white),
                              child: Text(
                                "${data[index].grouponMember}成团",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.red,
                                    fontSize: 30.sp),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 20.w)),
                            Container(
                              padding: EdgeInsets.all(10.w),
                              height: 60.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                  border: new Border.all(
                                      color: Colors.red, width: 0.5),
                                  // 边色与边宽度
                                  borderRadius: BorderRadius.circular(6.0),
                                  color: Colors.white),
                              child: Text(
                                "立减${data[index].grouponMember}",
                                style: TextStyle(
                                    height: 1,
                                    color: Colors.red,
                                    fontSize: 30.sp),
                              ),
                            ),
                            Padding(padding: EdgeInsets.only(right: 20.w))
                          ],
                        )),
                      ],
                    ),
                  ),
                ),
                childCount: data == null ? 0 : data.length,
              ),
            ),
        selector: (context, model) => model.data.grouponList);
  }

  Selector<HomeModel, List<HomeBrandList>> _getBrandSelector() {
    return Selector<HomeModel, List<HomeBrandList>>(
        builder: (context, data, _) => SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => Card(
                  child: Container(
                    child: InkWell(
                      onTap: () => print("object"),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CachedNetworkImage(
                            width: double.infinity,
                            height: 400.h,
                            fit: BoxFit.cover,
                            imageUrl: data[index].picUrl,
                          ),
                          Padding(padding: EdgeInsets.only(top: 10.h)),
                          Container(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Text(
                                data[index].name,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 28.sp),
                              )),
                          Padding(padding: EdgeInsets.only(top: 6.h)),
                          Container(
                              padding: EdgeInsets.only(left: 20.w),
                              child: Text(
                                data[index].desc,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 30.sp),
                              )),
                          Padding(padding: EdgeInsets.only(top: 6.h)),
                          Container(
                              padding:
                                  EdgeInsets.only(left: 20.w, bottom: 20.h),
                              child: Text(
                                Strings.DOLLAR + "${data[index].floorPrice}",
                                style: TextStyle(
                                    color: Colors.deepOrangeAccent,
                                    fontSize: 30.sp),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
                childCount: data == null ? 0 : data.length,
              ),
            ),
        selector: (context, model) => model.data.brandList);
  }

  Selector<HomeModel, int> _getBannerSelector() {
    return Selector<HomeModel, int>(
        builder: (context, value, child) => Container(
              child: child,
              padding: EdgeInsets.only(bottom: 10),
              color: value < 0 || model.allColors.isEmpty
                  ? Colors.white
                  : model.allColors[value],
            ),
        child: SafeArea(
            child: Selector<HomeModel, List<HomeBanner>>(
                builder: (context, banner, _) => Swiper(
                      key: UniqueKey(),
                      itemBuilder: (BuildContext context, int index) {
                        return Image(
                            image:
                                CachedNetworkImageProvider(banner[index].url));
                      },
                      // indicatorLayout: PageIndicatorLayout.COLOR,
                      autoplay: true,
                      itemCount: banner == null ? 0 : banner.length,
                      pagination: new SwiperPagination(),
                      onIndexChanged: (index) => model.bannerChange(index),
                    ),
                selector: (context, model) => model.data.banner)),
        selector: (context, model) => model.index);
  }

  Selector<HomeModel, List<HomeChannel>> _getChannelSelector() {
    return Selector<HomeModel, List<HomeChannel>>(
        builder: (context, data, _) => SliverGrid.extent(
              childAspectRatio: 1 / 1,
              maxCrossAxisExtent: 204.w,
              crossAxisSpacing: 20.w,
              children: List.generate(
                data == null ? 0 : data.length,
                (index) => InkWell(
                  onTap: () => print("object"),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      CachedNetworkImage(
                        width: 70.w,
                        height: 70.w,
                        imageUrl: data[index].iconUrl,
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 10.w),
                      ),
                      Text(
                        data[index].name,
                        style:
                            TextStyle(fontSize: 30.sp, color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
        selector: (context, model) => model.data.channel);
  }

  Selector<HomeModel, List<T>> _getGoodsSelector<T>() {
    return Selector<HomeModel, List<T>>(
        builder: (context, data, _) => _getGoodsWieght(data),
        selector: (context, model) {
          if (T.toString() == "HomeNewGoodsList") {
            return model.data.newGoodsList as List<T>;
          } else {
            return model.data.hotGoodsList as List<T>;
          }
        });
  }

  Widget _getGoodsWieght(List data) {
    return SliverGrid.extent(
      maxCrossAxisExtent: 540.w,
      crossAxisSpacing: 20.w,
      children: List.generate(
        data == null ? 0 : data.length,
        (index) => Container(
          child: InkWell(
            onTap: () => print("object"),
            child: Card(
              elevation: 2.0,
              margin: EdgeInsets.all(6.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                      margin: EdgeInsets.all(5.0),
                      child: CachedNetworkImage(
                        width: 250.w,
                        height: 250.w,
                        imageUrl: data[index].picUrl,
                      )),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4.0, top: 4.0),
                    child: Text(
                      data[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.black54, fontSize: 14.0),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 4.0),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 4.0, top: 4.0),
                    alignment: Alignment.center,
                    child: Text(
                      "￥${data[index].retailPrice}",
                      style: TextStyle(color: Colors.red, fontSize: 12.0),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
