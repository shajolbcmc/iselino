import 'package:json_annotation/json_annotation.dart';

part 'share_content_model.g.dart';

@JsonSerializable()
class ShareContentModel {
  ShareContentModel({this.success, this.message, this.data});

  bool? success;
  String? message;
  DataShareContent? data;

  factory ShareContentModel.fromJson(Map<String, dynamic> json) => _$ShareContentModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShareContentModelToJson(this);
}

@JsonSerializable()
class DataShareContent {
  DataShareContent({this.content});

  String? content;

  factory DataShareContent.fromJson(Map<String, dynamic> json) => _$DataShareContentFromJson(json);

  Map<String, dynamic> toJson() => _$DataShareContentToJson(this);
}
