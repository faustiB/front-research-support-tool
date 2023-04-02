import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class SpecialIssuesProvider extends GetConnect {
  Future<Response> getSpecialIssues() async =>
      await get('${dotenv.env['BACKEND_API']}/specialIssues');

  Future<Response> searchSpecialIssuesByTitle(String title) async =>
      await get('${dotenv.env['BACKEND_API']}/specialIssues/search/$title');
}