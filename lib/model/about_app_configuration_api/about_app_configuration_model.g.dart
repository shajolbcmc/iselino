// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'about_app_configuration_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AboutAppConfigurationModel _$AboutAppConfigurationModelFromJson(
  Map<String, dynamic> json,
) => AboutAppConfigurationModel(
  success: json['success'] as bool?,
  message: json['message'] as String?,
  data: json['data'] == null
      ? null
      : DataAboutAppConfiguration.fromJson(
          json['data'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$AboutAppConfigurationModelToJson(
  AboutAppConfigurationModel instance,
) => <String, dynamic>{
  'success': instance.success,
  'message': instance.message,
  'data': instance.data,
};

DataAboutAppConfiguration _$DataAboutAppConfigurationFromJson(
  Map<String, dynamic> json,
) => DataAboutAppConfiguration(
  whats_app_number: json['whats_app_number'] as String?,
  call_number: json['call_number'] as String?,
  copyright: json['copyright'] as String?,
  description: json['description'] as String?,
  facebook_url: json['facebook_url'] as String?,
  instagram_url: json['instagram_url'] as String?,
  is_show_social: json['is_show_social'] as bool?,
  messenger: json['messenger'] as String?,
  skype: json['skype'] as String?,
  snapchat: json['snapchat'] as String?,
  twitter_url: json['twitter_url'] as String?,
  youtube: json['youtube'] as String?,
);

Map<String, dynamic> _$DataAboutAppConfigurationToJson(
  DataAboutAppConfiguration instance,
) => <String, dynamic>{
  'whats_app_number': instance.whats_app_number,
  'instagram_url': instance.instagram_url,
  'twitter_url': instance.twitter_url,
  'facebook_url': instance.facebook_url,
  'call_number': instance.call_number,
  'snapchat': instance.snapchat,
  'skype': instance.skype,
  'messenger': instance.messenger,
  'youtube': instance.youtube,
  'is_show_social': instance.is_show_social,
  'copyright': instance.copyright,
  'description': instance.description,
};
