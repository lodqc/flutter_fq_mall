import 'package:flutter/material.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Text("1"),
    );
  }
}
