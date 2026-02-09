// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'progress_bar_style_model.g.dart';

@JsonSerializable()
class ProgressBarStyleModel {
  ProgressBarStyleModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataProgressBarStyle? data;

  factory ProgressBarStyleModel.fromJson(Map<String, dynamic> json) => _$ProgressBarStyleModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProgressBarStyleModelToJson(this);
}

@JsonSerializable()
class DataProgressBarStyle {
  DataProgressBarStyle({
    this.progress_bar_required,
    this.loader_style,
  });

  bool? progress_bar_required;
  String? loader_style;

  factory DataProgressBarStyle.fromJson(Map<String, dynamic> json) => _$DataProgressBarStyleFromJson(json);

  Map<String, dynamic> toJson() => _$DataProgressBarStyleToJson(this);
}
