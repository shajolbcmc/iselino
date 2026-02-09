// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onesignal_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnesignalConfigurationModel _$OnesignalConfigurationModelFromJson(
  Map<String, dynamic> json,
) => OnesignalConfigurationModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] as String?,
);

Map<String, dynamic> _$OnesignalConfigurationModelToJson(
  OnesignalConfigurationModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};
