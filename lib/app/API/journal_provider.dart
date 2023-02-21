import 'package:get/get.dart';

class JournalProvider extends GetConnect {
  Future<Response> getJournals() async =>
      await get('http://localhost:3000/journals');
}