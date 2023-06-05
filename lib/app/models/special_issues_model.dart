/// @package research-support-tool
/// @copyright 2023 Daniel Amo * daniel.amo@salle.url.edu
/// @copyright 2023 La Salle Campus Barcelona, Universitat Ramon Llull https://www.salleurl.edu
/// @author Daniel Amo
/// @author Guillem Miró Sierra
/// @author Faozi Bouybaouene Gadrouz
/// @license http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later

import 'dart:convert';

List<SpecialIssuesModel> specialIssuesModelFromJson(String str) =>
    List<SpecialIssuesModel>.from(json.decode(str).map((x) => SpecialIssuesModel.fromJson(x)));

class SpecialIssuesModel {
  final String id;
  final String title;
  final String journal;
  final String section;
  final String webpage;
  final String submissionDeadline;
  final String description;
  final List<String> tags;

  SpecialIssuesModel({
    required this.id,
    required this.title,
    required this.journal,
    required this.section,
    required this.webpage,
    required this.submissionDeadline,
    required this.description,
    required this.tags,
  });

factory SpecialIssuesModel.fromJson(Map<String, dynamic> json) {
    return SpecialIssuesModel(
      id: json["_id"],
      title: json['title'],
      journal: json['journal'],
      section: json['section'],
      webpage: json['webpage'],
      submissionDeadline: json['submission_deadline'],
      description: json['description'],
      tags: json['tags'].cast<String>(),
    );
  }

  Map<String, dynamic> toJson() => {
        "_id": id,
        'title': title,
        'journal': journal,
        'section': section,
        'webpage': webpage,
        'submission_deadline': submissionDeadline,
        'description': description,
        'tags': tags,
      };
 }
