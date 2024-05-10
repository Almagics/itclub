





import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/persentation/resources/assets_manager.dart';

import '../Main/main_view.dart';

import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';



class BottomNavBarDemo extends StatefulWidget {
  const BottomNavBarDemo({super.key});

  @override
  _BottomNavBarDemoState createState() => _BottomNavBarDemoState();
}

class _BottomNavBarDemoState extends State<BottomNavBarDemo> {
  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MainView(),
    MainView(),
    MainView(),
    MainView(),
    MainView(),



  ];

  int _currentIndex = 0;
  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new MainView();
      case 1:
        return new MainView();
      case 2:
        return new MainView();

      case 3:
        return new MainView();





      default:
        return new Text("Error");
    }
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  List<String> titleList = ["Home", "Career Resources", "Discussion Forums","Profile"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        backgroundColor: ColorManager.venus,

        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: ColorManager.venus,
            statusBarBrightness: Brightness.dark
        ),

        elevation: 0.0,
        title: Center(child: Text(titleList[_currentIndex],style: Theme.of(context).textTheme.titleLarge,)),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        //key: _bottomNavigationKey,
        index: 0,
        height: 50.0,
        items:  <Widget>[
          Container(child: Image(image: AssetImage(ImageAssets.sec1),),height: 30, width: 30,),
          Container(child: Image(image: AssetImage(ImageAssets.sec2),),height: 30, width: 30,),
          Container(child: Image(image: AssetImage(ImageAssets.sec3),),height: 30, width: 30,),
          Container(child: Image(image: AssetImage(ImageAssets.sec4),),height: 30, width: 30,),

        ],
        color: ColorManager.primary,
        buttonBackgroundColor: ColorManager.primary,
        backgroundColor: ColorManager.venus,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: _getDrawerItemWidget(_currentIndex),


    );
  }
}