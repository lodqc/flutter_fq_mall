import 'package:flutter/material.dart';
import 'package:flutter_fq_mall/constant/string.dart';
import 'package:flutter_fq_mall/model/classify_model.dart';
import 'package:flutter_fq_mall/model/home_model.dart';
import 'package:flutter_fq_mall/ui/classify_view.dart';
import 'package:provider/provider.dart';

import 'home_view.dart';

class MainView extends StatefulWidget {
  @override
  _MainViewState createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedIndex = 0;
  List<Widget> _list = List()
    ..add(ChangeNotifierProvider(
      create: (context) => HomeModel(),
      child: HomeView(),
    ))
    ..add(ChangeNotifierProvider(
      create: (context) => ClassifyModel(),
      child: ClassifyView(),
    ))
    ..add(Text("3"))
    ..add(Text("4"));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: _list,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home), title: Text(Strings.HOME)),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text(Strings.CATEGORY),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text(Strings.SHOP_CAR),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text(Strings.MINE),
          ),
        ],
        selectedItemColor: Colors.deepOrangeAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
