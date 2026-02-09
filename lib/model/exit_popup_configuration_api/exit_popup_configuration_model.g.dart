// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exit_popup_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExitPopupConfigurationModel _$ExitPopupConfigurationModelFromJson(
  Map<String, dynamic> json,
) => ExitPopupConfigurationModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DataExitPopupConfiguration.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$ExitPopupConfigurationModelToJson(
  ExitPopupConfigurationModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

DataExitPopupConfiguration _$DataExitPopupConfigurationFromJson(
  Map<String, dynamic> json,
) => DataExitPopupConfiguration(
  title: json['title'] as String?,
  Image: json['Image'] as String?,
  enable_Image: json['enable_Image'] as bool?,
  negative_text: json['negative_text'] as String?,
  positive_text: json['positive_text'] as String?,
);

Map<String, dynamic> _$DataExitPopupConfigurationToJson(
  DataExitPopupConfiguration instance,
) => <String, dynamic>{
  'title': instance.title,
  'positive_text': instance.positive_text,
  'negative_text': instance.negative_text,
  'enable_Image': instance.enable_Image,
  'Image': instance.Image,
};
