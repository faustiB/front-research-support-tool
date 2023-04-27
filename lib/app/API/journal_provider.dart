import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class JournalProvider extends GetConnect {
  Future<Response> getJournals() async => await get('${dotenv.env['BACKEND_API']}/journals');

  Future<Response> searchJournalsByTitle(String title) async => await get('${dotenv.env['BACKEND_API']}/journals/search/$title');

  Future<Response> insertJournal(Map<String, dynamic> journal, String token) async =>
      await post('${dotenv.env['BACKEND_API']}/journals', journal,
          headers: { "Content-Type": "application/json", "Accept": "application/json","Authorization": 'Bearer $token'});
}
