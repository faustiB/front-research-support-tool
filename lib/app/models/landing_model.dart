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

