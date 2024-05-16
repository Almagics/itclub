
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/data/firebase_auth/firebase_auth_service.dart';
import 'package:itclub/persentation/job/jobListView.dart';
import 'package:itclub/persentation/post/AddPostView.dart';
import 'package:itclub/persentation/post/PostListView.dart';

import '../appbar_bottom/navBottomWighget.dart';

import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/routes_manager.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {

  int _selectedIndex = 0;
  final List<Widget> _screens = [
    MainView(),
    MainView(),
    MainView(),
    MainView(),



  ];





  final FirebaseAuthService _auth = FirebaseAuthService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     // bottomNavigationBar: NavBottom(nopage: _page,),
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: ColorManager.venus,
          child:  Center(
            child: Column(
              children: <Widget>[


                Container(child: const Center(child: Image(image: AssetImage(ImageAssets.logo), height: 150,width: 150,))),
                Text("Itclub",style: Theme.of(context).textTheme.headlineLarge,),


                 Row(

mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    GestureDetector(
                      child: Card(

                        elevation: 4.0,
                        margin: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            // Image at the top of the card
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                              child: SizedBox(width: MediaQuery.of(context).size.width * 0.4,
                                child: const Image(
                                  image: AssetImage(ImageAssets.card1),
                                  width: double.infinity,
                                  height: 150.0,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            // const SizedBox(height: 10.0),
                            // Text at the bottom of the card, centered with shadow
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child:  Center(
                                child: Text(
                                    'Career Resources',
                                    style: Theme.of(context).textTheme.titleLarge
                                ),
                              ),
                            ),
                          ],
                        ),


                      ),
                      onTap: (){

                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => JobListView()));
                      },
                    ),
                    GestureDetector(

                      child: Card(
                        elevation: 4.0,
                        margin: const EdgeInsets.all(16.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Column(
                          children: [
                            // Image at the top of the card
                             ClipRRect(
                              borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                              child: SizedBox(width: MediaQuery.of(context).size.width * 0.4,
                                child: const Image(
                                   image: AssetImage(ImageAssets.card2),
                                  width: double.infinity,
                                  height: 150.0,

                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                           // const SizedBox(height: 10.0),
                            // Text at the bottom of the card, centered with shadow
                            Container(
                              padding: EdgeInsets.all(16.0),
                              child:  Center(
                                child: Text(
                                  'Discussion Forums',
                                  style: Theme.of(context).textTheme.titleLarge
                                ),
                              ),
                            ),
                          ],
                        ),


                ),
                      onTap: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (ctx) => PostListView()));
                      },
                    )
]),


                Row(

                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [

                      GestureDetector(
                        child: Card(

                          elevation: 4.0,
                          margin: const EdgeInsets.all(16.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          child: Column(
                            children: [
                              // Image at the top of the card
                              Container(

                                child: ClipRRect(
                                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
                                  child: SizedBox(width: MediaQuery.of(context).size.width * 0.4,
                                    child: const Image(
                                      image: AssetImage(ImageAssets.card3),
                                      width: double.infinity,
                                      height: 150.0,
                                
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              // const SizedBox(height: 10.0),
                              // Text at the bottom of the card, centered with shadow
                              Container(

                                padding: EdgeInsets.all(16.0),
                                child:  Center(
                                  child: Text(
                                      'Resources Material',
                                      style: Theme.of(context).textTheme.titleLarge
                                  ),
                                ),
                              ),
                            ],
                          ),


                        ),
                        onTap: (){

                            Navigator.pushReplacementNamed(context, Routes.materialList);
                        },
                      ),

                    ]),

              ],
            ),
          ),
        )

    );
  }
}
