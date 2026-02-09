import 'package:json_annotation/json_annotation.dart';

part 'onesignal_configuration_model.g.dart';

@JsonSerializable()
class OnesignalConfigurationModel {
  OnesignalConfigurationModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  String? data;

  factory OnesignalConfigurationModel.fromJson(Map<String, dynamic> json) => _$OnesignalConfigurationModelFromJson(json);

  Map<String, dynamic> toJson() => _$OnesignalConfigurationModelToJson(this);
}
