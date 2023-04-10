
import 'package:get_storage/get_storage.dart';
import 'package:softic_task/helpers/routes.dart';
import 'package:softic_task/services/navigation_service.dart';

import '../../../constants/app_constants.dart';

  final storage =GetStorage();
onPressedLogout()async{

      await storage.write(kKeyIdToken,null);
      await  storage.write(kKeyUserImage,null);
      await storage.write(kKeyUserFirstName,null);
      await storage.write(kKeyUserLastName,null);
      await  storage.write(kKeyUserEmail,null);
      await  storage.write(kKeyUserPhone,null);
      await  storage.write(kKeyIsLoggedIn,null);

      NavigationService.navigateToReplacement(Routes.loginScreen);
}