// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'splash_model.g.dart';

@JsonSerializable()
class SplashModel {
  SplashModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataSplash? data;

  factory SplashModel.fromJson(Map<String, dynamic> json) => _$SplashModelFromJson(json);

  Map<String, dynamic> toJson() => _$SplashModelToJson(this);
}

@JsonSerializable()
class DataSplash {
  DataSplash({
    this.first_color,
    this.second_color,
    this.splash_logo,
    this.enable_splash_logo,
    this.enable_splash_title,
    this.splash_title,
    this.splash_title_color,
    this.enable_splash_background,
    this.splash_background,
  });

  String? first_color;
  String? second_color;
  String? splash_logo;
  bool? enable_splash_logo;
  bool? enable_splash_title;
  String? splash_title;
  String? splash_title_color;
  bool? enable_splash_background;
  String? splash_background;

  factory DataSplash.fromJson(Map<String, dynamic> json) => _$DataSplashFromJson(json);

  Map<String, dynamic> toJson() => _$DataSplashToJson(this);
}
