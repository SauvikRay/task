import 'dart:convert';
import 'dart:developer';
import 'package:get_storage/get_storage.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:softic_task/constants/api_endpoints.dart';
import 'package:softic_task/services/api_service/dio.dart';

import '../../../constants/app_constants.dart';

  final storage = GetStorage();
class ProfileRepository{
  
  Box? _box;
  
  openProfileBox()async{
    var directory = await getApplicationDocumentsDirectory();
    Hive.init(directory.path);
    _box = await Hive.openBox('profileData');
    return;
  }

    Future profileData(data)async{
    await _box!.clear();
      _box!.add(data);
  }

  fetchProfileData()async{
    // await openProfileBox();
      final authToken = storage.read(kKeyIdToken);
      try{
          final response = await getHttp(Endpoints.getProfileApi(),authToken);
          if(response.statusCode ==200){
              Map data = json.decode(json.encode(response.data));
              log(data.toString());
              storage.writeIfNull(kKeyUserImage,data['imageUrl']);
              storage.writeIfNull(kKeyUserFirstName,data['firstName']);
              storage.writeIfNull(kKeyUserLastName,data['lastName']);
              storage.writeIfNull(kKeyUserEmail,data['email']);
              storage.writeIfNull(kKeyUserPhone,data['phone']);
          }

      }catch(e){
        print(e.toString);
      }
  }

}