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
import 'package:research_support_tool/app/ui/pages/add/add_journal_page.dart';

import '../../theme/app_colors.dart';
import 'add_special_issue.dart';

class AddPage extends StatefulWidget {
  const AddPage({Key? key}) : super(key: key);

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  final controller = Get.put(AddController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add a new item"),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                "Add Special Issue",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (controller.token.value == "") {
                  //alert dialog with form to login
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Login"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: controller.usernameController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                            ),
                          ),
                          const SizedBox(height: 40),
                          TextField(
                            controller: controller.passwordController.value,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await controller.login();
                            if (controller.failedAttempt.value) {
                              showSnackbar(context, "Login failed");
                            } else {
                              Get.back();
                              showSnackbar(context, "Login successful");
                              Get.to(() => const AddSpecialIssuePage(), transition: Transition.rightToLeft);
                            }
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  );
                } else {
                  print("token : ${controller.token.value}");
                  //TODO: add special issue directly to form
                }
              },
            ),
            const SizedBox(width: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Theme.of(context).primaryColor,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              child: const Text(
                "Add Journal",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () {
                if (controller.token.value == "") {
                  //alert dialog with form to login
                  Get.dialog(
                    AlertDialog(
                      title: const Text("Login"),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextField(
                            controller: controller.usernameController.value,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Username',
                            ),
                          ),
                          const SizedBox(height: 10),
                          TextField(
                            controller: controller.passwordController.value,
                            obscureText: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Password',
                            ),
                          ),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () async {
                            await controller.login();
                            if (controller.failedAttempt.value) {
                              showSnackbar(context, "Login failed");
                            } else {
                              Get.back();
                              showSnackbar(context, "Login successful");
                              Get.to(() => AddJournalPage(), transition: Transition.rightToLeft);
                            }
                            //TODO: Get to form page for Journals
                          },
                          child: const Text('Login'),
                        ),
                      ],
                    ),
                  );
                } else {
                  print("token : ${controller.token.value}");
                  //TODO: Go to add journal directly to form
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  void showSnackbar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: AppColors.primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: const BorderSide(color: AppColors.primaryColor),
        ),
        margin: const EdgeInsets.all(20),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 8),
      ),
    );
  }
}
