import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_fq_mall/weight/ios_classical_header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: ListView.builder(
                itemBuilder: (context, index) => Container(
                  height: 192.h,
                  child: Center(
                    child: Text(
                      "data",
                      style:
                          TextStyle(fontSize: 40.sp, color: Color(0xff666666)),
                    ),
                  ),
                  decoration: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 1.h, color: Colors.orange))),
                ),
                itemCount: 20,
              ),
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
                    onRefresh: () {},
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(20.w),
                            child: CachedNetworkImage(
                                height: 300.h,
                                width: double.infinity,
                                fit: BoxFit.cover,
                                imageUrl:
                                    "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg"),
                          ),
                          Text(
                            "data",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 40.sp, color: Color(0xff666666)),
                          ),
                          GridView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 3, childAspectRatio: 0.9),
                            itemBuilder: (context, index) => Card(
                              child: Padding(
                                padding: EdgeInsets.only(top: 40.h),
                                child: Column(
                                  children: [
                                    CachedNetworkImage(
                                        height: 150.h,
                                        width: double.infinity,
                                        fit: BoxFit.cover,
                                        imageUrl:
                                            "https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1091405991,859863778&fm=26&gp=0.jpg"),
                                    Padding(
                                        padding: EdgeInsets.only(top: 20.h)),
                                    Text(
                                      "data",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 30.sp,
                                          color: Color(0xff666666)),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            itemCount: 27,
                          ),
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
