import 'dart:convert';
import 'dart:developer';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:softic_task/constants/api_endpoints.dart';
import 'package:softic_task/services/api_service/dio.dart';

class PostLoginRepository{
  Future<Map>postLoginApi({required String userName, required String password,required bool rememberMe})async{
    Map data = {
      "username": userName,
      "password": password,
      "rememberMe": true
    };
  
    final response = await postHttp(Endpoints.postLogin(),data);
   
    if(response.statusCode ==200){
       Map data = json.decode(json.encode(response.data));
      //  log(data.toString());
      //  EasyLoading.dismiss();
       return data;
    }else{

     EasyLoading.dismiss();
   Map data = json.decode(json.encode(response.data));
    return data;
    }

  }
}