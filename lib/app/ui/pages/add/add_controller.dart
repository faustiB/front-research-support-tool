import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../API/login_provider.dart';

class AddController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  var token = "".obs;
  var failedAttempt = false.obs;

  var loginProvider = LoginProvider();
  var usernameController = TextEditingController().obs;
  var passwordController = TextEditingController().obs;

  login() async {
    var response = await loginProvider.login(usernameController.value.text, passwordController.value.text);
    if (!response.status.hasError) {
      token.value = response.body["token"];
    } else {
      token.value = "";
      failedAttempt.value = true;
    }
  }
}