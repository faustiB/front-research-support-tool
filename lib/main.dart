import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/modules/home/home_view.dart';
import 'package:research_support_tool/app/modules/home/home_binding.dart';
import 'package:research_support_tool/app/routes/app_pages.dart';
import 'package:research_support_tool/app/routes/app_routes.dart';


void main() {
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
      theme: ThemeData( primarySwatch: Colors.blue),
      home: HomeView(),
      getPages: AppPages.pages ,
    );
  }
}
