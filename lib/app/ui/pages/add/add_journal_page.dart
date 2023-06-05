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

class AddJournalPage extends StatefulWidget {
  const AddJournalPage({super.key});

  @override
  _AddJournalPageState createState() => _AddJournalPageState();
}

class _AddJournalPageState extends State<AddJournalPage> {
  final controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new Jorunal"),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: Column(
          children: [
            TextField(
              controller: controller.titleController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.descriptionController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Description',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.editorialController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Editorial',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.issnController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ISSN',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.issn10Controller.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ISSN-10',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.issn13Controller.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'ISSN-13',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.quartileController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quartile',
              ),
            ),
            const SizedBox(height: 35),
            TextField(
              controller: controller.quartileYearController.value,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Quartile Year',
              ),
            ),
            const SizedBox(height: 35),
            ElevatedButton(
              onPressed: () {
                controller.addJournal();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                'Add Journal',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
