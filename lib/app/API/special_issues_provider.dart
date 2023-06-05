/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

class SpecialIssuesProvider extends GetConnect {
  Future<Response> getSpecialIssues() async => await get('${dotenv.env['BACKEND_API']}/specialIssues');

  Future<Response> searchSpecialIssuesByTitle(String title) async =>
      await get('${dotenv.env['BACKEND_API']}/specialIssues/search/$title');

  Future<Response> insertSpecialIssue(Map<String, dynamic> specialIssue, String token) async =>
      await post('${dotenv.env['BACKEND_API']}/specialIssues', specialIssue,
          headers: {"Content-Type": "application/json", "Accept": "application/json", "Authorization": 'Bearer $token'});
}
