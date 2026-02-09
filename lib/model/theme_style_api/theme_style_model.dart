// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'theme_style_model.g.dart';

@JsonSerializable()
class ThemeStyleModel {
  ThemeStyleModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataThemeStyle? data;

  factory ThemeStyleModel.fromJson(Map<String, dynamic> json) => _$ThemeStyleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ThemeStyleModelToJson(this);
}

@JsonSerializable()
class DataThemeStyle {
  DataThemeStyle({
    this.theme_color,
    this.theme_color_1,
    this.theme_color_2,
    this.gradient_enable,
  });

  String? theme_color;
  String? theme_color_1;
  String? theme_color_2;
  bool? gradient_enable;

  factory DataThemeStyle.fromJson(Map<String, dynamic> json) => _$DataThemeStyleFromJson(json);

  Map<String, dynamic> toJson() => _$DataThemeStyleToJson(this);
}
