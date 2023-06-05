/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

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
