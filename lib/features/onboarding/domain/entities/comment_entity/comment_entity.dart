import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';

part 'comment_entity.g.dart';

@JsonSerializable()
@HiveType(typeId: HiveTypesConstants.commentHiveType)
class CommentEntity {
  @JsonKey(name: 'postId')
  @HiveField(0)
  final int? postId;

  @JsonKey(name: 'id')
  @HiveField(1)
  final int? id;

  @JsonKey(name: 'name')
  @HiveField(2)
  final String? name;

  @JsonKey(name: 'email')
  @HiveField(3)
  final String? email;

  @JsonKey(name: 'body')
  @HiveField(4)
  final String? body;

  CommentEntity({
    this.postId,
    this.id,
    this.name,
    this.email,
    this.body,
  });

  factory CommentEntity.fromJson(Map<String, dynamic> json) => CommentEntity(
        postId: json['postId'],
        id: json['id'],
        name: json['name'],
        email: json['email'],
        body: json['body'],
      );

  Map<String, dynamic> toJson() => {
        "postId": postId,
        "id": id,
        "name": name,
        "email": email,
        "body": body,
      };
}
