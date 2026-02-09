// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataModel _$DataModelFromJson(Map<String, dynamic> json) => DataModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$DataModelToJson(DataModel instance) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  app_name: json['app_name'] as String?,
  base_url: json['base_url'] as String?,
  app_language: json['app_language'] as String?,
  navigation_style: json['navigation_style'] as String?,
  header_style: json['header_style'] as String?,
  bottom_navigation: json['bottom_navigation'] as String?,
  tab_style: json['tab_style'] as String?,
  disable_header: json['disable_header'] as bool?,
  disable_footer: json['disable_footer'] as bool?,
  javascript_enable: json['javascript_enable'] as bool?,
  required_flash_screen: json['required_flash_screen'] as bool?,
  is_support_zoom_functionality: json['is_support_zoom_functionality'] as bool?,
  required_walkthrough: json['required_walkthrough'] as bool?,
  is_support_webrtc_functionality:
      json['is_support_webrtc_functionality'] as bool?,
  is_enable_pull_to_refresh: json['is_enable_pull_to_refresh'] as bool?,
  walkthrough_style: json['walkthrough_style'] as String?,
  clear_cookies: json['clear_cookies'] as bool?,
  required_exit_popup_screen: json['required_exit_popup_screen'] as bool?,
  required_floating_action_button:
      json['required_floating_action_button'] as String?,
  floating_button_style: json['floating_button_style'] as String?,
  app_logo: json['app_logo'] as String?,
  floating_buttton_logo: json['floating_buttton_logo'] as String?,
  theme_style: json['theme_style'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'app_name': instance.app_name,
  'base_url': instance.base_url,
  'app_language': instance.app_language,
  'navigation_style': instance.navigation_style,
  'header_style': instance.header_style,
  'bottom_navigation': instance.bottom_navigation,
  'tab_style': instance.tab_style,
  'disable_header': instance.disable_header,
  'disable_footer': instance.disable_footer,
  'javascript_enable': instance.javascript_enable,
  'required_flash_screen': instance.required_flash_screen,
  'is_support_zoom_functionality': instance.is_support_zoom_functionality,
  'required_walkthrough': instance.required_walkthrough,
  'is_support_webrtc_functionality': instance.is_support_webrtc_functionality,
  'is_enable_pull_to_refresh': instance.is_enable_pull_to_refresh,
  'walkthrough_style': instance.walkthrough_style,
  'clear_cookies': instance.clear_cookies,
  'required_exit_popup_screen': instance.required_exit_popup_screen,
  'required_floating_action_button': instance.required_floating_action_button,
  'floating_button_style': instance.floating_button_style,
  'app_logo': instance.app_logo,
  'floating_buttton_logo': instance.floating_buttton_logo,
  'theme_style': instance.theme_style,
};
