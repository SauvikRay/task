import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softic_task/constants/app_constants.dart';
import 'package:softic_task/helpers/routes.dart';
import 'package:softic_task/features/login/data/login_repository.dart';
import 'package:softic_task/services/navigation_service.dart';

import '../../product/data/product_repository.dart';
import '../../../widgets/custom_snackbar.dart';
import 'package:flutter/foundation.dart';

import '../../user/data/profile_repository.dart';

onpressedSignin({required BuildContext context, required String userName, required String password,required rememberMe})async{
  final storage = GetStorage();
  if(userName.isEmpty){
    CustomSnackbar(
      context: context,
      content: "Enter user Name",
      backgroundColor: Colors.red
    );
    return;
  } else if(password.isEmpty){
    CustomSnackbar(
      context: context,
      content: "Enter your password",
      backgroundColor: Colors.red
    );
    return;
  }

  var userLoginResponse= await PostLoginRepository().postLoginApi(userName: userName,password: password,rememberMe: false);
  log("User Response ${userLoginResponse}");
  if(userLoginResponse.isNotEmpty && userLoginResponse['id_token'] != null){
   final idToken= userLoginResponse['id_token'];
  storage.writeIfNull(kKeyIdToken,idToken);
  storage.writeIfNull(kKeyIsLoggedIn,true);
  // await ProductRepository().getAllProductsResponse();
  await  ProfileRepository().fetchProfileData();
  await ProductRepository().fetchAllProductsResponse();
  EasyLoading.dismiss();
  NavigationService.navigateToReplacement(Routes.productList);

  }else{
          EasyLoading.dismiss();
          // log(userLoginResponse.toString());
          CustomSnackbar(
            context: NavigationService.context,
            content: "Unauthorized",
            backgroundColor: Colors.red
          );
  }

}