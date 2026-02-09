// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_style_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ThemeStyleModel _$ThemeStyleModelFromJson(Map<String, dynamic> json) =>
    ThemeStyleModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataThemeStyle.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ThemeStyleModelToJson(ThemeStyleModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DataThemeStyle _$DataThemeStyleFromJson(Map<String, dynamic> json) =>
    DataThemeStyle(
      theme_color: json['theme_color'] as String?,
      theme_color_1: json['theme_color_1'] as String?,
      theme_color_2: json['theme_color_2'] as String?,
      gradient_enable: json['gradient_enable'] as bool?,
    );

Map<String, dynamic> _$DataThemeStyleToJson(DataThemeStyle instance) =>
    <String, dynamic>{
      'theme_color': instance.theme_color,
      'theme_color_1': instance.theme_color_1,
      'theme_color_2': instance.theme_color_2,
      'gradient_enable': instance.gradient_enable,
    };
