import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/pages/home/home_page.dart';
import 'package:research_support_tool/app/ui/pages/home/home_binding.dart';
import 'package:research_support_tool/app/routes/app_pages.dart';
import 'package:research_support_tool/app/ui/theme/app_theme_data.dart';


Future<void> main() async {
  await dotenv.load(fileName: ".env");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      initialBinding: HomeBinding(),
      theme:AppThemeData.lightTheme,
      home: HomePage(showSearchBar: false),
      getPages: AppPages.pages ,
    );
  }
}
