import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/firebase_auth/firebase_auth_service.dart';
import '../resources/assets_manager.dart';
import '../resources/color_manager.dart';
import '../resources/font_manager.dart';
import '../resources/routes_manager.dart';
import '../resources/strings_manager.dart';
import '../resources/styles_manager.dart';
import '../resources/values_manager.dart';
import '../widget/app_text_form_filed.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {

  final FirebaseAuthService _auth = FirebaseAuthService();
  final  _store = FirebaseFirestore.instance;


  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
 // final idController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  //final birthDayController = TextEditingController();
  final passwordController = TextEditingController();
 final addressController = TextEditingController();

  final userTypeController = TextEditingController();
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body:  SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              height: MediaQuery.of(context).size.height,
              color: ColorManager.venus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SafeArea(child: SizedBox.shrink()),
                   Container(
                     margin: const EdgeInsets.all(AppPadding.p8),
                     child: Padding(padding: EdgeInsets.all(AppPadding.p8),
                      child: Center(child: Text('Register New User',style: Theme.of(context).textTheme.headlineLarge,)),




                  ),
                   ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'First Name',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                   Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(

                      controller: firstNameController,
                      hintText: 'Enter First Name',
                    )
                  ),


                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Last Name',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                   Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(

                      controller: lastNameController,
                      hintText: 'Enter Last Name',
                    ),),






                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'E-mail',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                    Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      iconData: Icons.email_outlined,
                      controller: emailController,
                      hintText: 'Enter E-mail',
                    )),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                     'Password',
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),

                   Padding(padding: EdgeInsets.all(AppPadding.p8),
                    child: AppTextFormFiled(
                      obscureText: true,
                      suffixIcon: true,
                      iconData: Icons.lock,
                      controller: passwordController,
                      hintText: 'Enter Password',
                    ),),



                  const SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(3,0,3,0),
                    child: Center(
                      child: SizedBox(width: 380,height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                            _signup();
                          },


                          style: Theme.of(context).elevatedButtonTheme.style,
                          child: const Text('Register Now'),

                        ),
                      ),
                    ),
                  ),










                  const SizedBox(height: 10,),



                  Padding(
                    padding: const EdgeInsets.fromLTRB(3,0,3,0),
                    child: Center(
                      child: SizedBox(width: 380,height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            //pageController.animateToPage(getNextIndex, duration: const Duration(microseconds: AppConstants.splashDelay), curve: Curves.bounceInOut);
                            Navigator.pushReplacementNamed(context, Routes.loginRoute);
                          },


                          style: ElevatedButton.styleFrom(


                            textStyle: getRegularStyle(fontSize:FontSize.s15,color: ColorManager.white), backgroundColor: ColorManager.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(AppSize.s8),




                            ),

                            //elevation: 10.0,

                          ),
                          child:  Text('Back To Login',
                            style: TextStyle(color: ColorManager.black),

                          ),

                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
  void _signup() async{
    String firstName = firstNameController.text;
    String lastName= lastNameController.text;


    String email = emailController.text;

    String password = passwordController.text;

    String role = 'user';
    User? user = await _auth.signupWithEmailAndPassword(email, password);





    if(user!= null){
      print("User is successfully created");
      await _store.collection("Users")
          .doc(email)
          .set({

        "email":email,
        "password":password,
        "FullName":firstName + lastName,



        "Role":role,
        "Username":user.uid.toString()


      });



      Navigator.pushReplacementNamed(context, Routes.newhome);



    }else{
      _displayDialog('Registration failed. Please try again.');
    }



  }

  void _displayDialog(String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Registration Error'),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }


}


