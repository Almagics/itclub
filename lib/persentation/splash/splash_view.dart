import 'dart:async';

import 'package:flutter/material.dart';

import 'package:itclub/persentation/resources/color_manager.dart';

import '../resources/assets_manager.dart';
import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {

  Timer? _timer;

  _startDelay(){

    _timer = Timer(const Duration(seconds: 4), _goNext);
  }

  _goNext(){
    Navigator.pushReplacementNamed(context, Routes.loginRoute);

  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  _startDelay();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.venus,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(child: Image(image: AssetImage(ImageAssets.logo),)),

           Center(child: Text('Welcome to',style:  TextStyle(color:ColorManager.primary ,fontSize: 40),)),
           Center(child: Text('ItClub', style: TextStyle(color: ColorManager.primary,fontSize: 40, ),)),
        ],
      ),


    );
  }
  @override
  void dispose() {
    _timer?.cancel();
    // TODO: implement dispose
    super.dispose();
  }
}
