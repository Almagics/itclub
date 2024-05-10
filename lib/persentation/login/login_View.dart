


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:itclub/persentation/resources/strings_manager.dart';
import 'package:itclub/persentation/resources/values_manager.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/styles_manager.dart';
import '../widget/app_text_form_filed.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            color: ColorManager.venus ,
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                 Container(padding: const EdgeInsets.only(top: 100,right: 4,left: 4,bottom: 4),
                  child: const Center(child: Image(image: AssetImage(ImageAssets.logo),height: 200,width: 200,)),





                ),

                Center(child: Text('ItClub', style: TextStyle(color: ColorManager.primary,fontSize: 40, ),)),
                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'E-mail',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                 Container(padding: const EdgeInsets.all(AppPadding.p8),
                  child: AppTextFormFiled(
                    iconData: Icons.email_outlined,
                    controller: emailController,
                    hintText: 'Enter E-mail',
                  )),


                    const SizedBox(
                     height: 20.0,
                   ),

                Container(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    'Password',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),

                Container(padding: const EdgeInsets.all(AppPadding.p8),
                  child: AppTextFormFiled(
                      obscureText: true,
                      suffixIcon: true,
                      iconData: Icons.lock,
                      controller: passwordController,
                      hintText: 'Enter Password',
                  ),),



                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.fromLTRB(3,0,3,0),
                  child: Center(
                    child: SizedBox(width: 380,height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                         // Navigator.pushReplacementNamed(context, Routes.mainRoute);
                          _signin();
                        },


                        style: Theme.of(context).elevatedButtonTheme.style,
                        child: const Text('Login'),

                      ),
                    ),
                  ),
                ),

                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, Routes.forgetpassword);

                      },
                      child: Text(
                       'Forget Password',
                        style: Theme.of(context).textTheme.headlineMedium,

                      ),
                    ),
                  ),
                ),



                const SizedBox(height: 10,),


                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pushReplacementNamed(context, Routes.registerRoute);

                      },
                      child: Text(
                        'Don’t have an account? Sign Up',
                        style: Theme.of(context).textTheme.headlineMedium,

                      ),
                    ),
                  ),
                ),







              ],
            ),
          ),
        ),
      ),
        );


  }


  void _signin() async{

    String email = emailController.text;
    //String birthday = birthDayController.text;
    String password = passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);


    Navigator.pushReplacementNamed(context, Routes.newhome);


    if(user!= null){
      print("User is successfully login");




      Navigator.pushReplacementNamed(context, Routes.newhome);



    }else{
      _displayDialog('user name or password incorrect');
    }



  }

  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: ( context) {
        return AlertDialog(
          title: const Text('Error',
          textAlign: TextAlign.center,

          ),
          content: Text(message,
          textAlign: TextAlign.center,),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }






}




