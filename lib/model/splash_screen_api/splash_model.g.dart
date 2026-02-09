// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SplashModel _$SplashModelFromJson(Map<String, dynamic> json) => SplashModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DataSplash.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SplashModelToJson(SplashModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DataSplash _$DataSplashFromJson(Map<String, dynamic> json) => DataSplash(
  first_color: json['first_color'] as String?,
  second_color: json['second_color'] as String?,
  splash_logo: json['splash_logo'] as String?,
  enable_splash_logo: json['enable_splash_logo'] as bool?,
  enable_splash_title: json['enable_splash_title'] as bool?,
  splash_title: json['splash_title'] as String?,
  splash_title_color: json['splash_title_color'] as String?,
  enable_splash_background: json['enable_splash_background'] as bool?,
  splash_background: json['splash_background'] as String?,
);

Map<String, dynamic> _$DataSplashToJson(DataSplash instance) =>
    <String, dynamic>{
      'first_color': instance.first_color,
      'second_color': instance.second_color,
      'splash_logo': instance.splash_logo,
      'enable_splash_logo': instance.enable_splash_logo,
      'enable_splash_title': instance.enable_splash_title,
      'splash_title': instance.splash_title,
      'splash_title_color': instance.splash_title_color,
      'enable_splash_background': instance.enable_splash_background,
      'splash_background': instance.splash_background,
    };
