/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/pages/add/add_controller.dart';

class AddSpecialIssuePage extends StatefulWidget {
  const AddSpecialIssuePage({super.key});

  @override
  _AddSpecialIssuePageState createState() => _AddSpecialIssuePageState();
}

class _AddSpecialIssuePageState extends State<AddSpecialIssuePage> {
  final controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Special Issue"),
      ),
      body: Container(
        //Form with the special issues model in order to insert it in firebase, the same way as the journal
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.specialIssueTitleController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.specialIssueJournalController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Journal',
              ),
            ),
            const SizedBox(height: 35),
            //add all the fields that has a specialissue text edditng controller in the add_controller.dart
            TextField(
              controller: controller.specialIssueSectionController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Section',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.specialIssueWebPageController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Web Page',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.specialIssueSubmissionDateController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Submission Date',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.specialIssueDescriptionController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.specialIssueTagsController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tags',
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () {
                controller.addSpecialIssue();
              },
              child: const Text(
                'Add Special Issue',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
