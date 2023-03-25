import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/components/custom_doc_tab_cell.dart';
import 'package:research_support_tool/app/ui/components/custom_tab_cell.dart';
import 'package:research_support_tool/app/ui/pages/home/home_controller.dart';
import '../../components/detail_page.dart';
import '../../theme/app_colors.dart';
import '../../components//menu_item.dart';

class HomePage extends StatefulWidget {

  HomePage({super.key, required this.showSearchBar});
  bool showSearchBar = false;
  String section = "journals";
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
  void refresh() {
    setState(() {
      widget.showSearchBar = !widget.showSearchBar;
    });
  }

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
                child: CustomMenuBar(showSearchBar: widget.showSearchBar, notifyParent: refresh),
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
                          if (controller.numbersByDocumentType[i].collection == "journals") {
                            widget.section = "journals";
                            controller.getJournals();
                          }
                          if (controller.numbersByDocumentType[i].collection == "special_issues") {
                            widget.section = "special_issues";
                            //TODO: Implement for special issues in controller
                          }

                          if (controller.numbersByDocumentType[i].collection == "conferences") {
                            widget.section = "conferences";
                            //TODO: Implement for conferences in controller
                          }
                        },
                        child: CustomDocTabCell(
                            collection: HomePage.beautifyName(controller.numbersByDocumentType[i].collection),
                            docCount: controller.numbersByDocumentType[i].count),
                      ),
                  ],
                ),
              ),
            ),
            AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              height: widget.showSearchBar ? 70 : 0,
              margin: const EdgeInsets.symmetric(vertical: 10),
              color: AppColors.primaryColor,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 500),
                opacity: widget.showSearchBar ? 1.0 : 0.0,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: AppColors.white,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Icon(
                        Icons.search,
                        color: AppColors.primaryColor),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          border: Border(
                            top: BorderSide(width: 1.0, color: AppColors.primaryColor),
                            left: BorderSide(width: 1.0, color: AppColors.primaryColor),
                            right: BorderSide(width: 1.0, color: AppColors.primaryColor),
                            bottom: BorderSide(width: 1.0, color: AppColors.primaryColor),
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: TextField(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                          ),
                          onChanged: (text) {
                            if (text.isEmpty) {
                              switch (widget.section) {
                                case "journals":
                                  controller.getJournals();
                                  break;
                                case "special_issues":
                                  //TODO: controller.getSpecialIssues();
                                  break;
                                case "conferences":
                                  //TODO: controller.getJournals();
                                  break;
                                default:
                                  break;
                              }
                            } else {
                              switch (widget.section) {
                                case "journals":
                                  controller.searchJournalsByTitle(text);
                                  break;
                                case "special_issues":
                                //TODO: controller.searchSpecialIssuesByTitle(text);
                                  break;
                                case "conferences":
                                //TODO: controller.searchConferencesByTitle(text);
                                  break;
                                default:
                                  break;
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
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

class CustomMenuBar extends StatefulWidget {
  bool showSearchBar;
  final Function() notifyParent;
  CustomMenuBar({super.key, required this.showSearchBar, required this.notifyParent});

  @override
  State<CustomMenuBar> createState() => _CustomMenuBarState();
}

class _CustomMenuBarState extends State<CustomMenuBar> {
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
              setState(() => {widget.showSearchBar = !widget.showSearchBar});
              widget.notifyParent();
            },
            child: const CustomMenuItem(
              title: "Search ",
              icon: Icons.search,
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
