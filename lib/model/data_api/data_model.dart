// ignore_for_file: non_constant_identifier_names

import 'package:json_annotation/json_annotation.dart';

part 'data_model.g.dart';

@JsonSerializable()
class DataModel {
  DataModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  Data? data;

  factory DataModel.fromJson(Map<String, dynamic> json) => _$DataModelFromJson(json);

  Map<String, dynamic> toJson() => _$DataModelToJson(this);
}

@JsonSerializable()
class Data {
  Data({
    this.app_name,
    this.base_url,
    this.app_language,
    this.navigation_style,
    this.header_style,
    this.bottom_navigation,
    this.tab_style,
    this.disable_header,
    this.disable_footer,
    this.javascript_enable,
    this.required_flash_screen,
    this.is_support_zoom_functionality,
    this.required_walkthrough,
    this.is_support_webrtc_functionality,
    this.is_enable_pull_to_refresh,
    this.walkthrough_style,
    this.clear_cookies,
    this.required_exit_popup_screen,
    this.required_floating_action_button,
    this.floating_button_style,
    this.app_logo,
    this.floating_buttton_logo,
    this.theme_style,
  });

  String? app_name;
  String? base_url;
  String? app_language;
  String? navigation_style;
  String? header_style;
  String? bottom_navigation;
  String? tab_style;
  bool? disable_header;
  bool? disable_footer;
  bool? javascript_enable;
  bool? required_flash_screen;
  bool? is_support_zoom_functionality;
  bool? required_walkthrough;
  bool? is_support_webrtc_functionality;
  bool? is_enable_pull_to_refresh;
  String? walkthrough_style;
  bool? clear_cookies;
  bool? required_exit_popup_screen;
  String? required_floating_action_button;
  String? floating_button_style;
  String? app_logo;
  String? floating_buttton_logo;
  String? theme_style;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
