import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SpecialIssuesProvider extends GetConnect {
  Future<Response> getSpecialIssues() async => await get('${dotenv.env['BACKEND_API']}/specialIssues');

  Future<Response> searchSpecialIssuesByTitle(String title) async =>
      await get('${dotenv.env['BACKEND_API']}/specialIssues/search/$title');

  Future<http.Response> insertSpecialIssue (Map<String, dynamic> specialIssue, String token) async {
    var url = '${dotenv.env['BACKEND_API']}/specialIssues';
    Uri uri = Uri.parse(url);

    //encode Map to JSON
    var body = json.encode(specialIssue);

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
        body: body
    );
    return response;
  }
}
