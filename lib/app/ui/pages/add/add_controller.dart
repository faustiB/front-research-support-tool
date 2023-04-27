import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../API/journal_provider.dart';
import '../../../API/login_provider.dart';
import '../home/home_page.dart';

class AddController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var token = "".obs;
  var failedAttempt = false.obs;

  var loginProvider = LoginProvider();
  var journalProvider = JournalProvider();

  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  ///Text Editing controllers for insert.
  var titleController = TextEditingController().obs;
  var descriptionController = TextEditingController().obs;
  var editorialController = TextEditingController().obs;
  var issnController = TextEditingController().obs;
  var issn10Controller = TextEditingController().obs;
  var issn13Controller = TextEditingController().obs;
  var quartileController = TextEditingController().obs;
  var quartileYearController = TextEditingController().obs;

  login() async {
    var response = await loginProvider.login(usernameController.value.text, passwordController.value.text);
    if (!response.status.hasError) {
      failedAttempt.value = false;
      token.value = response.body["token"];
    } else {
      token.value = "";
      failedAttempt.value = true;
    }
  }

  addJournal() async {
    var journal = {
      "title": titleController.value.text,
      "description": descriptionController.value.text,
      "editorial": editorialController.value.text,
      "issn": issnController.value.text,
      "issn10": issn10Controller.value.text,
      "issn13": issn13Controller.value.text,
      "quartile": quartileController.value.text,
      "quartileYear": quartileYearController.value.text,
    };
    var response = await journalProvider.insertJournal(journal, token.value);
    if (!response.status.hasError) {
      Get.offAll(() => HomePage(
            showSearchBar: false,
          ));
      Get.snackbar(
        "Success",
        "Journal added successfully",
        backgroundColor: Colors.lightBlueAccent,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    } else {
      Get.snackbar(
        "Error",
        "Error while adding journal",
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        snackStyle: SnackStyle.FLOATING,
        colorText: Colors.white,
      );
    }
  }
}
