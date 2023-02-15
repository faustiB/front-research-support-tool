import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context){
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home Page Test App bar"),
        ),
        body: const Center(
          child: Text("I'm at home! all good?"),
        ),
      ),
    );
  }
}