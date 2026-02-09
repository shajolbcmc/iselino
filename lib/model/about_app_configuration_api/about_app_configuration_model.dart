// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'about_app_configuration_model.g.dart';

@JsonSerializable()
class AboutAppConfigurationModel {
  AboutAppConfigurationModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataAboutAppConfiguration? data;

  factory AboutAppConfigurationModel.fromJson(Map<String, dynamic> json) => _$AboutAppConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$AboutAppConfigurationModelToJson(this);
}

@JsonSerializable()
class DataAboutAppConfiguration {
  DataAboutAppConfiguration({
    this.whats_app_number,
    this.call_number,
    this.copyright,
    this.description,
    this.facebook_url,
    this.instagram_url,
    this.is_show_social,
    this.messenger,
    this.skype,
    this.snapchat,
    this.twitter_url,
    this.youtube,
  });

  String? whats_app_number;
  String? instagram_url;
  String? twitter_url;
  String? facebook_url;
  String? call_number;
  String? snapchat;
  String? skype;
  String? messenger;
  String? youtube;
  bool? is_show_social;
  String? copyright;
  String? description;

  factory DataAboutAppConfiguration.fromJson(Map<String, dynamic> json) => _$DataAboutAppConfigurationFromJson(json);

  Map<String, dynamic> toJson() => _$DataAboutAppConfigurationToJson(this);
}
