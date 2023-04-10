import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_constants.dart';


class CustomTheme {
  BuildContext? context;


  static ThemeData get mainTheme {
    return ThemeData(
        primaryColor: Colors.white,
       primarySwatch:Colors.blueGrey,
       scaffoldBackgroundColor: Colors.white,
      textTheme: 
         TextTheme(
        //  final head1 = Theme.of(context).textTheme.headline1; // Bold 18
        //  final head2 = Theme.of(context).textTheme.headline2; //Normal 18
        //  final head3 = Theme.of(context).textTheme.headline3;//Bold 16
        // final head4 = Theme.of(context).textTheme.headline4; // 16, normal
        // final head5 = Theme.of(context).textTheme.headline5; // 14, normal
        // final body1 = Theme.of(context).textTheme.bodyText1; //20,Bold
        // final body2 = Theme.of(context).textTheme.bodyText2; //16,normal, ash
        // final sub1 = Theme.of(context).textTheme.subtitle1; //12,bold,
        // final sub2 = Theme.of(context).textTheme.subtitle2; //12,normal,


           displayLarge: TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold,), 
           displayMedium: TextStyle(fontSize:18.sp,fontWeight: FontWeight.normal,),
           displaySmall: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.bold,),
           headlineMedium: TextStyle(fontSize: 16.sp,fontWeight: FontWeight.normal,),
           headlineSmall: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.normal,),
           titleLarge: TextStyle(fontSize: 14.sp,fontWeight: FontWeight.bold,),
           bodyLarge: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.bold,),
           titleMedium: TextStyle( fontSize: 12.sp, fontWeight: FontWeight.bold,),
           titleSmall: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal,),

          //  labelLarge: TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold,color: Colors.white),


        ),
          //TabBar Theme
          tabBarTheme: TabBarTheme(
            labelColor: AppColors.highLightText,
            labelStyle: TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold),
            labelPadding: EdgeInsets.only(bottom: 20.h),
            unselectedLabelColor: Colors.black,
            unselectedLabelStyle: TextStyle(fontSize:18.sp,fontWeight: FontWeight.bold),
            //indicatorWeight: 5.h,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.h,color: AppColors.highLightText)
            ),

          ),
          //AppBar Theme
          appBarTheme: AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.bold,color: Colors.black),
          iconTheme:const IconThemeData(color: Colors.purpleAccent,),
          
          ),

          
          
        
      //   buttonTheme: ButtonThemeData(
          
      //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
      //   buttonColor:const Color(0xFF6B34BE), 
      //   height: 60,
      //   minWidth: double.infinity,
      // ),
      
    
    );
  }
  
}