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
