
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LoginProvider extends GetConnect {
  Future<Response> login(String username, String password) async =>
      await post('${dotenv.env['BACKEND_API']}/landing/login', {
        'username': username,
        'password': password,
      });
}