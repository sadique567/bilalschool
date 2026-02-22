import 'package:bilalschool/app/environment/environment.dart';
import 'package:bilalschool/app/routes/app_pages.dart';
import 'package:bilalschool/dependency_Injection.dart';
import 'package:bilalschool/theme/MyTheme.dart';
import 'package:bilalschool/theme/MyThemeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DependencyInjection.init();
  Environment().initConfig(Environment.DEVELOPMENT);
  Get.put(Mythemecontroller(), permanent: true);
    
  // -----------FCM-----------
  // await Firebase.initializeApp();
  // // options: DefaultFirebaseOptions.currentPlatform
  // FirebaseMessaging.onBackgroundMessage(
  //   NotificationService.firebaseBackgroundHandler,
  // );
  // await NotificationService.init();

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: EasyLoading.init(),
    );
  }
}


/*    info@bilalschool.in     12345678
STUDENT
User: 9920558167	
Pass: ras1sc	
PARENT
User id: 9920558167	
Pass: 6t67cm
STUDENT
User: 9820243824	
Pass: d144h8	
PARENT 
User id: 9820243824	
Pass: agxzq8
*/