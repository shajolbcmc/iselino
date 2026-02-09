import 'package:json_annotation/json_annotation.dart';

part 'onboarding_title_model.g.dart';

@JsonSerializable()
class OnBoardingTitleModel {
  OnBoardingTitleModel({this.success, this.data});

  bool? success;
  List<DataOnBoardingTitle>? data;

  factory OnBoardingTitleModel.fromJson(Map<String, dynamic> json) => _$OnBoardingTitleModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnBoardingTitleModelToJson(this);
}

@JsonSerializable()
class DataOnBoardingTitle {
  DataOnBoardingTitle({
    this.id,
    this.title,
    this.subtitle,
  });

  int? id;
  String? title;
  String? subtitle;

  factory DataOnBoardingTitle.fromJson(Map<String, dynamic> json) => _$DataOnBoardingTitleFromJson(json);

  Map<String, dynamic> toJson() => _$DataOnBoardingTitleToJson(this);
}
