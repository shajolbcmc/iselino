// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'exit_popup_configuration_model.g.dart';

@JsonSerializable()
class ExitPopupConfigurationModel {
  ExitPopupConfigurationModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataExitPopupConfiguration? data;

  factory ExitPopupConfigurationModel.fromJson(Map<String, dynamic> json) => _$ExitPopupConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$ExitPopupConfigurationModelToJson(this);
}

@JsonSerializable()
class DataExitPopupConfiguration {
  DataExitPopupConfiguration({
    this.title,
    this.Image,
    this.enable_Image,
    this.negative_text,
    this.positive_text,
  });

  String? title;
  String? positive_text;
  String? negative_text;
  bool? enable_Image;
  String? Image;

  factory DataExitPopupConfiguration.fromJson(Map<String, dynamic> json) => _$DataExitPopupConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DataExitPopupConfigurationToJson(this);
}
