import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/common/bean/home_bean.dart';
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

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Selector<HomeModel, int>(
          builder: (context, value, child) => Container(
                child: child,
                padding: EdgeInsets.only(bottom: 10),
                color: value < 0 || model.allColors.isEmpty
                    ? Colors.white
                    : model.allColors[value],
              ),
          child: SafeArea(
              child: SizedBox(
            width: double.infinity,
            height: 540.w,
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
                selector: (context, model) => model.data.banner),
          )),
          selector: (context, model) => model.index),
    );
  }
}

