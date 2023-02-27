import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class JournalProvider extends GetConnect {
  Future<Response> getJournals() async =>
      await get('${dotenv.env['BACKEND_API']}/journals');
}