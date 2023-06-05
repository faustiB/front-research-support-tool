/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class LandingProvider extends GetConnect {
  Future<Response> getNumbersByDocumentType() async =>
      await get('${dotenv.env['BACKEND_API']}/landing/getNumbersByDocumentType');
}