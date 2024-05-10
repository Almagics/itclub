import 'package:flutter/material.dart';
import 'package:itclub/persentation/resources/color_manager.dart';
import 'package:itclub/persentation/resources/font_manager.dart';
import 'package:itclub/persentation/resources/styles_manager.dart';
import 'package:itclub/persentation/resources/values_manager.dart';




ThemeData getApplicationTheme(){




  return ThemeData(

    //main color
primaryColor: ColorManager.primary,
primaryColorLight: ColorManager.lightPrimary,
primaryColorDark: ColorManager.darkPrimary,
disabledColor:  ColorManager.grey1,
splashColor: ColorManager.lightPrimary,




//cardview
  cardTheme: CardTheme(
      color: ColorManager.white,
    shadowColor: ColorManager.venus,
    elevation: AppSize.s4



  ),

//app bar

  appBarTheme: AppBarTheme(
    centerTitle:true,
    color: ColorManager.white,
    elevation: AppSize.s4,
    shadowColor: ColorManager.venus,
    titleTextStyle: getRegularStyle(fontSize: FontSize.s16, color: ColorManager.white)


  ),

//button
  buttonTheme: ButtonThemeData(
    shape: const StadiumBorder(),
    disabledColor: ColorManager.white,
    buttonColor: ColorManager.white,
    splashColor: ColorManager.white,
  ),
elevatedButtonTheme: ElevatedButtonThemeData(

  style: ElevatedButton.styleFrom(
    textStyle: getRegularStyle(fontSize:FontSize.s15,color: Colors.yellow),


    backgroundColor: ColorManager.primary,

    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(AppSize.s8),




    ),
    elevation: 10.0,
  )

),







//text theme

  textTheme: TextTheme(
    headlineLarge: getBoldStyle(color: ColorManager.black,fontSize: FontSize.s30),
    headlineMedium: getRegularStyle(color: ColorManager.primary,fontSize: FontSize.s14),
    titleLarge: getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s16),
    bodyLarge: getRegularStyle(color: ColorManager.primary),
    bodySmall: getRegularStyle(color: ColorManager.primary),
    displayLarge:getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s30),


  ),

//inout decoration
  inputDecorationTheme: InputDecorationTheme(
      //contant paddibg
    contentPadding: const EdgeInsets.all(AppPadding.p8),
  hintStyle: getRegularStyle(color: ColorManager.primary, fontSize: FontSize.s14),
  labelStyle:   getMediumStyle(color: ColorManager.primary, fontSize: FontSize.s14),
    errorStyle: getRegularStyle(color: ColorManager.error),


    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
  ),


  focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
  borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
  ),

errorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.error, width: AppSize.s1_5),
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
),

focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color: ColorManager.primary, width: AppSize.s1_5),
    borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8))
),

  )
  );
}