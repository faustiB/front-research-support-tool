import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text("Home v1"),
        ),
        body: Column(
          children: [
            const Text("These are the journals"),
            Expanded(

              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemCount: controller.journals.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Center(child: Text(controller.journals[index].title)),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
