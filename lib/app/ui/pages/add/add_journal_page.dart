
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
              child: const Text('Add Journal'),
            ),
          ],
        ),
      ),
    );
  }
}