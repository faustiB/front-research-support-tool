import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class JournalProvider extends GetConnect {
  Future<Response> getJournals() async => await get('${dotenv.env['BACKEND_API']}/journals');

  Future<Response> searchJournalsByTitle(String title) async => await get('${dotenv.env['BACKEND_API']}/journals/search/$title');

  Future<http.Response> insertJournal (Map<String, dynamic> journal, String token) async {
    var url = '${dotenv.env['BACKEND_API']}/journals';
    Uri uri = Uri.parse(url);

    //encode Map to JSON
    var body = json.encode(journal);

    var response = await http.post(uri,
        headers: {"Content-Type": "application/json", "Authorization": 'Bearer $token'},
        body: body
    );
    return response;
  }
}
