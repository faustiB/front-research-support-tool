import 'package:flutter/material.dart';
import 'package:research_support_tool/app/ui/theme/app_colors.dart';

/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
import '../pages/home/home_controller.dart';

class CustomDocTabCell extends StatefulWidget {
  final String collection;
  final int docCount;
  bool isHovering = false;
  HomeController controller;

  CustomDocTabCell({super.key,  required this.collection, required this.docCount, required this.controller});

  @override
  State<CustomDocTabCell> createState() => _CustomDocTabCellState();
}

class _CustomDocTabCellState extends State<CustomDocTabCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              processClick();
              ScaffoldMessenger.of(context).showSnackBar(
                 SnackBar(
                  content: Text('${widget.collection} loaded'),
                   backgroundColor: AppColors.primaryColor,
                   shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                     side: const BorderSide(color: AppColors.primaryColor),
                ),
                   margin: const EdgeInsets.all(20),
                   behavior: SnackBarBehavior.floating,
                   duration: const Duration(seconds: 2),
                 ),
              );
            },
            onHover: (hovering) {
              setState(() {
                widget.isHovering = hovering;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 150),
              curve: Curves.easeInOut,
              transform: widget.isHovering
                  ?  Matrix4.translationValues(0, -10, 0)
                  :  Matrix4.translationValues(0, 0, 0),
              child: Container(
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
                      widget.collection,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                    Text(
                      widget.docCount.toString(),
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void processClick() {
    if (widget.collection == "Journals") {
      widget.controller.section = "journals";
      widget.controller.getJournals();
    } else if (widget.collection == "Special Issues") {
      widget.controller.section = "special_issues";
      widget.controller.getSpecialIssues();
    } else if (widget.collection == "Conferences") {
      //TODO: widget.controller.getConferences();
    }
  }
}
