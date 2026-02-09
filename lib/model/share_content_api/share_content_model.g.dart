// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'share_content_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShareContentModel _$ShareContentModelFromJson(Map<String, dynamic> json) =>
    ShareContentModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      data: json['data'] == null
          ? null
          : DataShareContent.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ShareContentModelToJson(ShareContentModel instance) =>
    <String, dynamic>{
      'success': instance.success,
      'message': instance.message,
      'data': instance.data,
    };

DataShareContent _$DataShareContentFromJson(Map<String, dynamic> json) =>
    DataShareContent(content: json['content'] as String?);

Map<String, dynamic> _$DataShareContentToJson(DataShareContent instance) =>
    <String, dynamic>{'content': instance.content};
