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
        body: Center(
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.grey,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for(var i = 0; i < controller.numbersByDocumentType.length; i++)
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 120,
                                height: 120,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                    top: BorderSide(width: 1.0, color: Colors.black),
                                    left: BorderSide(width: 1.0, color: Colors.black),
                                    right: BorderSide(width: 1.0, color: Colors.black),
                                    bottom: BorderSide(width: 1.0, color: Colors.black),
                                  ),
                                  borderRadius: BorderRadius.all(Radius.circular(100.0)),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        beautifyName(controller.numbersByDocumentType[i].collection),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )
                                    ),
                                    Text(
                                        controller.numbersByDocumentType[i].count.toString(),
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20,
                                        )
                                    ),
                                  ],
                                ),
                              ),
                            ],
                )
                        )
                    ],
                  ),
                )
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
              ),],
          )
        )
      ),
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
