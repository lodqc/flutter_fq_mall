import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/config/navigator_util.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
//    Future.delayed(Duration(seconds: 3), () {
//      NavigatorUtils.goMallMainPage(context);
//    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(child: Text("data")),
      ),
    );
  }
}
