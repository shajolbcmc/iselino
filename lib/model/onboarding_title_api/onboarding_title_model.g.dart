// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onboarding_title_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnBoardingTitleModel _$OnBoardingTitleModelFromJson(
  Map<String, dynamic> json,
) => OnBoardingTitleModel(
  success: json['success'] as bool?,
  data: (json['data'] as List<dynamic>?)
      ?.map((e) => DataOnBoardingTitle.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$OnBoardingTitleModelToJson(
  OnBoardingTitleModel instance,
) => <String, dynamic>{'success': instance.success, 'data': instance.data};

DataOnBoardingTitle _$DataOnBoardingTitleFromJson(Map<String, dynamic> json) =>
    DataOnBoardingTitle(
      id: (json['id'] as num?)?.toInt(),
      title: json['title'] as String?,
      subtitle: json['subtitle'] as String?,
    );

Map<String, dynamic> _$DataOnBoardingTitleToJson(
  DataOnBoardingTitle instance,
) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
};
