import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/components/custom_doc_tab_cell.dart';
import 'package:research_support_tool/app/ui/components/custom_tab_cell.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';

import '../../components/detail_page.dart';
import '../../theme/app_colors.dart';

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
          body: Center(
              child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.secondaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < controller.numbersByDocumentType.length; i++)
                        CustomDocTabCell(
                            collection: beautifyName(controller.numbersByDocumentType[i].collection),
                            docCount: controller.numbersByDocumentType[i].count),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 8,
                child: ListView.builder(
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
            ],
          ))),
    );
  }

  static String beautifyName(String name) {
    switch (name) {
      case "journals":
        return "Journals";
      case "special_issues":
        return "Special Issues";
      case "conferences":
        return "Conferences ";
      default:
        return name;
    }
  }
}
