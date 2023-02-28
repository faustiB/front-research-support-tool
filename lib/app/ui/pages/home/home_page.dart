import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/components/custom_tab_cell.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';
import 'package:get/get.dart';
import '../../components/detail_page.dart';

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
        body: ListView.builder(
          shrinkWrap: true,
          physics: const BouncingScrollPhysics(),
          itemCount: controller.journals.length,
          itemBuilder: (context, index) {
            return InkWell(
                onTap: () {
                  Get.to(() => DetailPage(journal: controller.journals[index]));
                },
                child: CustomTabCell(journal: controller.journals[index]));
          },
        ),
      ),
    );
  }
}
