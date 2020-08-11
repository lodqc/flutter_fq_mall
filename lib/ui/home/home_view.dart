import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
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

  int _count = 20;

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
            setState(() {
              _count = 20;
            });
            _controller.resetLoadState();
          });
        },
        onLoad: () async {
          await Future.delayed(Duration(seconds: 2), () {
            print('onLoad');
            setState(() {
              _count += 10;
            });
            _controller.finishLoad(noMore: _count >= 40);
          });
        },
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: SliverCustomHeaderDelegate(
                collapsedHeight: 200.h,
                expandedHeight: 560.h,
                child: Selector<HomeModel, int>(
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
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Image(
                                        image: CachedNetworkImageProvider(
                                            banner[index].url));
                                  },
                                  // indicatorLayout: PageIndicatorLayout.COLOR,
                                  autoplay: true,
                                  itemCount: banner == null ? 0 : banner.length,
                                  pagination: new SwiperPagination(),
                                  onIndexChanged: (index) =>
                                      model.bannerChange(index),
                                ),
                            selector: (context, model) => model.data.banner)),
                    selector: (context, model) => model.index)),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  width: 60.0,
                  height: 60.0,
                  child: Center(
                    child: Text('$index'),
                  ),
                  color: index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
                );
              },
              childCount: _count,
            ),
          ),
        ],
      ),
    );
  }
}
