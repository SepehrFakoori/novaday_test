import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';

part 'post_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypesConstants.postHiveType)
class PostEntity extends HiveObject {
  @JsonKey(name: 'userId')
  @HiveField(0)
  final int? userId;

  @JsonKey(name: 'id')
  @HiveField(1)
  final int? id;

  @JsonKey(name: 'title')
  @HiveField(2)
  final String? title;

  @JsonKey(name: 'body')
  @HiveField(3)
  final String? body;

  PostEntity({
    this.userId,
    this.id,
    this.title,
    this.body,
  });

  factory PostEntity.fromJson(Map<String, dynamic> json) => PostEntity(
        userId: json['userId'],
        id: json['id'],
        title: json['title'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
      };
}
