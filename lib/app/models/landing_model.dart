import 'dart:convert';

/*[
  {
    "collection": "special_issues",
    "count": 2
  },
  {
    "collection": "journals",
    "count": 10
  }
]*/

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

