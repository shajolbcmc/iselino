// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'progress_bar_style_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProgressBarStyleModel _$ProgressBarStyleModelFromJson(
  Map<String, dynamic> json,
) => ProgressBarStyleModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DataProgressBarStyle.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$ProgressBarStyleModelToJson(
  ProgressBarStyleModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

DataProgressBarStyle _$DataProgressBarStyleFromJson(
  Map<String, dynamic> json,
) => DataProgressBarStyle(
  progress_bar_required: json['progress_bar_required'] as bool?,
  loader_style: json['loader_style'] as String?,
);

Map<String, dynamic> _$DataProgressBarStyleToJson(
  DataProgressBarStyle instance,
) => <String, dynamic>{
  'progress_bar_required': instance.progress_bar_required,
  'loader_style': instance.loader_style,
};
