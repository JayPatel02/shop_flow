import 'package:flutter/material.dart';
import 'package:shop_flow/core/constants/app_routes.dart';
import 'package:shop_flow/core/services/shared_preference_service.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferenceService.instance.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
        initialRoute: AppRoutes.splashScreen,
      ),
    );
  }
}