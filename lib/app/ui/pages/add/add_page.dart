import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:research_support_tool/app/ui/pages/add/add_controller.dart';

class AddPage extends StatefulWidget {
  AddPage({Key? key}) : super(key: key);
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
                onPressed: () {
                  if (controller.token.value == "") {
                    //alert dialog with form to login
                    Get.dialog(
                      AlertDialog(
                        title: const Text("Login"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            TextField(
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Username',
                              ),
                            ),
                            SizedBox(height: 10),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
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
                            onPressed: () {
                              //TODO Implement call to login
                              //controller.login();
                            },
                            child: const Text('Login'),
                          ),
                        ],
                      ),
                    );
                  } else {
                    Get.toNamed("/add/special_issue");
                  }
                },
                child: const Text(
                  "Add Special Issue",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
                onPressed: () {},
                child: const Text(
                  "Add Journal",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
