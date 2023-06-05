/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'dart:convert';
List<JournalModel> journalModelFromJson(String str) =>
    List<JournalModel>.from(json.decode(str).map((x) => JournalModel.fromJson(x)));

class JournalModel {
  final String id;
  final String title;
  final String editorial;
  final String issn;
  final String eissn;
  final String issn10;
  final String issn13;
  final String quartile;
  final int quartileYear;
  final String quartileWebpage;
  final List<String> edition;
  final List<String> categories;
  final List<String> articleTopology;
  final String webpage;
  final String description;
  final List<String> tags;

  JournalModel({
    required this.id,
    required this.title,
    required this.editorial,
    required this.issn,
    required this.eissn,
    required this.issn10,
    required this.issn13,
    required this.quartile,
    required this.quartileYear,
    required this.quartileWebpage,
    required this.edition,
    required this.categories,
    required this.articleTopology,
    required this.webpage,
    required this.description,
    required this.tags,
  });

  factory JournalModel.fromJson(Map<String, dynamic> json) {
    return JournalModel(
      id: json["_id"],
      title: json['title'],
      editorial: json['editorial'],
      issn: json['ISSN'],
      eissn: json['EISSN'],
      issn10: json['ISSN-10'],
      issn13: json['ISSN-13'],
      quartile: json['quartile'],
      quartileYear: json['quartile_year'],
      quartileWebpage: json['quartile_webpage'],
      edition: json['edition'].cast<String>(),
      categories: json['categories'].cast<String>(),
      articleTopology: json['article_topology'].cast<String>(),
      webpage: json['webpage'],
      description: json['description'],
      tags: json['tags'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        'title': title,
        'editorial': editorial,
        'ISSN': issn,
        'EISSN': eissn,
        'ISSN-10': issn10,
        'ISSN-13': issn13,
        'quartile': quartile,
        'quartile_year': quartileYear,
        'quartile_webpage': quartileWebpage,
        'edition': edition,
        'categories': categories,
        'article_topology': articleTopology,
        'webpage': webpage,
        'description': description,
        'tags': tags,
      };
}