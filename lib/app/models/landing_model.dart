/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'dart:convert';

List<LandingModel> landingModelFromJson(String str) =>
    List<LandingModel>.from(json.decode(str).map((x) => LandingModel.fromJson(x)));

class LandingModel {
  final String collection;
  final int count;

  LandingModel({
    required this.collection,
    required this.count,
  });

  factory LandingModel.fromJson(Map<String, dynamic> json) {
    return LandingModel(
      collection: json['collection'],
      count: json['count'],
    );
  }
}

