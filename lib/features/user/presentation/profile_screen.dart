import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softic_task/constants/app_constants.dart';
import 'package:softic_task/features/product/data/product_repository.dart';
import 'package:softic_task/helpers/space_helper.dart';

import '../data/profile_functions.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final storage =GetStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        height: ScreenUtil().screenHeight,
        width: ScreenUtil().screenWidth,
        child: Column(
          children: [
          SizedBox(
          height: 200.h,
          width:  ScreenUtil().screenWidth,
          child: Stack(children: [
             Container(
                      height: 150,
                      width: ScreenUtil().screenWidth,
                      decoration:const BoxDecoration(boxShadow: [
                        BoxShadow(color: Colors.grey,
                        blurRadius: 6,
                        spreadRadius: 5,
                        offset: Offset(0,1)
                        )
                      ]),
                      child:FadeInImage.assetNetwork(
                          placeholder: 'assets/no_image.png',
                          image:'https://www.ionos.com/digitalguide/fileadmin/DigitalGuide/Teaser/iptc-daten-t.jpg',
                           fit: BoxFit.cover
                      )
                      
                    ),
            
             Positioned(
                      bottom: 40,
                      child: SizedBox(
                        width: ScreenUtil().screenWidth,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                border:
                                    Border.all(color: Colors.white, width: 3),
                                //shape: BoxShape.rectangle,
                              ),
                              child: ClipRRect(
                                clipBehavior: Clip.hardEdge,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(100.0)),
                                child: FadeInImage.assetNetwork(
                                  placeholder: 'assets/no_image.png',
                                  image: '${storage.read(kKeyUserImage)}', //'https://marketplace.canva.com/EAFEits4-uw/1/0/800w/canva-boy-cartoon-gamer-animated-twitch-profile-photo-r0bPCSjUqg0.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
          ]),
          ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding:EdgeInsets.symmetric(horizontal: 10.w,),
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: const Color(0xFFEAEBF2)),
                height: 50.h,
                width:ScreenUtil().screenWidth,
                child: Row(
                   
                  children: [
                     Text('Name :',style:Theme.of(context).textTheme.headlineSmall ),
                    const Spacer(),
                    Text('${storage.read(kKeyUserFirstName)} ${storage.read(kKeyUserLastName)}',
                    style:Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            SpaceHelper.verticalSpaceSmall,
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding:EdgeInsets.symmetric(horizontal: 10.w,),
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: const Color(0xFFEAEBF2)),
                height: 50.h,
                width:ScreenUtil().screenWidth,
                child: Row(
                   
                  children: [
                     Text('Email :',style:Theme.of(context).textTheme.headlineSmall ),
                    const Spacer(),
                    Text('${storage.read(kKeyUserEmail)}',
                    style:Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),  
            SpaceHelper.verticalSpaceSmall,   
            Container(
                margin: EdgeInsets.symmetric(horizontal: 10.w),
                padding:EdgeInsets.symmetric(horizontal: 10.w,),
                decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: const Color(0xFFEAEBF2)),
                height: 50.h,
                width:ScreenUtil().screenWidth,
                child: Row(
                   
                  children: [
                     Text('Phone :',style:Theme.of(context).textTheme.headlineSmall ),
                    const Spacer(),
                    Text('${storage.read(kKeyUserPhone)}',
                    style:Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
              ),
            SpaceHelper.verticalSpaceLarge,   
            InkWell(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                      return AlertDialog(
        title: const Text('Are you sure to Logout'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('To see the product you need to login again'),
              Text('Would you like to logout?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            
            child: const Text('Yes',style:  TextStyle(color: Colors.red),),
            onPressed: () {
              onPressedLogout();  
            },
          ), TextButton(
            child: const Text('No',style:  TextStyle(color: Colors.black)),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
                },
              );

            },
              child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w),
                  padding:EdgeInsets.symmetric(horizontal: 10.w,),
                  decoration:BoxDecoration(borderRadius: BorderRadius.circular(10.r),color: const Color(0xFFEAEBF2)),
                  height: 50.h,
                  width:ScreenUtil().screenWidth,
                  child: Row(
                     
                    children: [
                       Text('Logout',style:Theme.of(context).textTheme.headlineMedium!.copyWith(color: Colors.black) ),
                      const Spacer(),
                      Icon(Icons.logout,size: 20.sp,)
                    ],
                  ),
                ),
            ),
        
        ]),
        
      ),
  
    );
  }
}