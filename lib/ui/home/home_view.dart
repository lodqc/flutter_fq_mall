import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
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
  EasyRefreshController _controller;

  // 条目总数
  int _count = 20;
  HomeModel model;

  @override
  void initState() {
    super.initState();
    model = context.read<HomeModel>();
    model.homeIndex();
    _controller = EasyRefreshController();
  }

//  EasyRefresh.custom(
//  enableControlFinishRefresh: false,
//  enableControlFinishLoad: true,
//  controller: _controller,
//  header: ClassicalHeader(),
//  footer: ClassicalFooter(),
//  onRefresh: () async {
//  await Future.delayed(Duration(seconds: 2), () {
//  print('onRefresh');
//  setState(() {
//  _count = 20;
//  });
//  _controller.resetLoadState();
//  });
//},
//onLoad: () async {
//await Future.delayed(Duration(seconds: 2), () {
//print('onLoad');
//setState(() {
//_count += 10;
//});
//_controller.finishLoad(noMore: _count >= 40);
//});
//},
//slivers: <Widget>[
//SliverList(
//delegate: SliverChildBuilderDelegate(
//(context, index) {
//return Container(
//width: 60.0,
//height: 60.0,
//child: Center(
//child: Text('$index'),
//),
//color:
//index % 2 == 0 ? Colors.grey[300] : Colors.transparent,
//);
//},
//childCount: _count,
//),
//),
//],
//)
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (_, model, child) => Container(
        child: child,
        padding: EdgeInsets.only(bottom: 10),
        color: model.swiperColor,
      ),
      child: SafeArea(child: Banner()),
    );
  }
}

class Banner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var model = context.watch<HomeModel>();
    return SizedBox(
      width: double.infinity,
      height: 540.w,
      child: Swiper(
        key: UniqueKey(),
        itemBuilder: (context, index) {
          model.getSwiperColor(model.data.banner[index].url);
          return Image.network(model.data.banner[index].url);
        },
        itemCount: model.data.banner == null ? 0 : model.data.banner.length,
        viewportFraction: 0.8,
        autoplay: true,
        scale: 0.9,
        pagination: new SwiperPagination(),
      ),
    );
  }
}
