import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:softic_task/constants/app_constants.dart';
import 'package:softic_task/constants/customtheme.dart';
import 'package:softic_task/features/product/presentation/product_list_screen.dart';
import 'package:softic_task/helpers/routes.dart';
import 'package:softic_task/services/api_service/dio.dart';
import 'package:softic_task/services/navigation_service.dart';
import 'features/login/presentation/login_screen.dart';
import 'features/user/data/profile_repository.dart';
import 'helpers/loading.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await GetStorage.init();
  DioSingleton.instance.create();
  runApp(const MyApp());
  configLoading();
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final storage =GetStorage();
bool isLogedIn = false;
  @override
  void initState() {
    checkLogedInStatus();
    super.initState();
  }
checkLogedInStatus(){
    if(storage.read(kKeyIsLoggedIn) != null){
      isLogedIn = storage.read(kKeyIsLoggedIn);
      var token = storage.read(kKeyIdToken);
      ProfileRepository().fetchProfileData();
      DioSingleton.instance.update(token);
    }

}
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
 return ScreenUtilInit(
   designSize:const Size(360,690),
   minTextAdapt: true,
   splitScreenMode: true,
   builder: (context, child) {
     
     return MaterialApp(
     debugShowCheckedModeBanner: false,
     builder: EasyLoading.init(),
     theme: CustomTheme.mainTheme,
     navigatorKey: NavigationService.navigatorKey,
     onGenerateRoute: RouteGenerator.generateRoute,
     home: child,
   );
   },
   child:isLogedIn?AllProductsScreen() : const LoginScreen(),
  );

    
  }
}
