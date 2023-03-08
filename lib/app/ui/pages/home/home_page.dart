import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/components/custom_doc_tab_cell.dart';
import 'package:research_support_tool/app/ui/components/custom_tab_cell.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';
import '../../components/detail_page.dart';
import '../../theme/app_colors.dart';
import '../../components//menu_item.dart';

class HomePage extends StatefulWidget {

  const HomePage({super.key});
  
  @override
  State<HomePage> createState() => _HomePageState();

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

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetX<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: AppColors.primaryColor,
                child: const CustomMenuBar(),
              ),
            ),
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
                      InkWell(
                        onTap: () {
                          //TODO: implement filter by document type
                        },
                        child: CustomDocTabCell(
                            collection: HomePage.beautifyName(controller.numbersByDocumentType[i].collection),
                            docCount: controller.numbersByDocumentType[i].count),
                      ),
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
        ),
      ),
    );
  }
}

class CustomMenuBar extends StatelessWidget {
  const CustomMenuBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          InkWell(
            onTap: () {
              //TODO Implent go to different pages on menu (Get.To)
            },
            child: const CustomMenuItem(
              title: "Home",
              icon: Icons.home,
            ),
          ),
          InkWell(
            onTap: () {
              //TODO Implent go to different pages on menu (Get.To)
            },
            child: const CustomMenuItem(
              title: "Add ",
              icon: Icons.add,
            ),
          ),
          InkWell(
            onTap: () {
              //TODO Implent go to different pages on menu (Get.To)
            },
            child: const CustomMenuItem(
              title: "My Profile",
              icon: Icons.person,
            ),
          ),
        ],
      ),
    );
  }
}
