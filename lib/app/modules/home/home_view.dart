import 'package:flutter/material.dart';
import 'package:research_support_tool/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home view"),
        ),
        body: const Center(
          child: Text("I'm at home!"),
        ),
      ),
    );
  }
}