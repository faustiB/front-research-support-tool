import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LandingProvider extends GetConnect {
  Future<Response> getNumbersByDocumentType() async =>
      await get('${dotenv.env['BACKEND_API']}/landing/getNumbersByDocumentType');
}