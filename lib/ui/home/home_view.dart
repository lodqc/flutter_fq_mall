import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
import 'package:flutter_fq_mall/common/constant/string.dart';
import 'package:flutter_fq_mall/common/weight/sliver_custom_header_delegate.dart';
import 'package:flutter_fq_mall/generated/i18n.dart';
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
  EasyRefreshController _controller = EasyRefreshController();

  @override
  void initState() {
    super.initState();
    model = context.read<HomeModel>();
    model.homeIndex();
  }

  // Header浮动
  bool _headerFloat = false;

  // 震动
  bool _vibration = true;

  // 无限加载
  bool _enableInfiniteLoad = true;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: EasyRefresh.custom(
        enableControlFinishRefresh: false,
        enableControlFinishLoad: true,
        controller: _controller,
        header: ClassicalHeader(
          enableInfiniteRefresh: false,
          bgColor: _headerFloat ? Theme.of(context).primaryColor : null,
          infoColor: _headerFloat ? Colors.black87 : Colors.teal,
          float: _headerFloat,
          enableHapticFeedback: _vibration,
          refreshText: S.of(context).pullToRefresh,
          refreshReadyText: S.of(context).releaseToRefresh,
          refreshingText: S.of(context).refreshing,
          refreshedText: S.of(context).refreshed,
          refreshFailedText: S.of(context).refreshFailed,
          noMoreText: S.of(context).noMore,
          infoText: S.of(context).updateAt,
        ),
        footer: ClassicalFooter(
          enableInfiniteLoad: _enableInfiniteLoad,
          enableHapticFeedback: _vibration,
          loadText: S.of(context).pushToLoad,
          loadReadyText: S.of(context).releaseToLoad,
          loadingText: S.of(context).loading,
          loadedText: S.of(context).loaded,
          loadFailedText: S.of(context).loadFailed,
          noMoreText: S.of(context).noMore,
          infoText: S.of(context).updateAt,
        ),
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onRefresh');
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            _controller.finishLoad(noMore: true);
          });
        },
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                collapsedHeight: 200.h,
                expandedHeight: 560.h,
                child: _getBannerSelector()),
          ),
          _getChannelSelector(),
          SliverToBoxAdapter(
            child: Container(
              height: 40.0,
              alignment: Alignment.center,
              child: Text(Strings.COUPON_AREA),
            ),
          ),
          _getCouponSelector(),
        ],
      ),
    );
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
                                    style: TextStyle(
                                        fontSize: 50.sp, color: Colors.grey),
                                  ),
                                ),
                                Divider(
                                  color: Colors.grey,
                                ),
                                Expanded(
                                  child: Container(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                            TextStyle(fontSize: 26.sp, color: Colors.black87),
                      )
                    ],
                  ),
                ),
              ),
            ),
        selector: (context, model) => model.data.channel);
  }
}
