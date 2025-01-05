import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';

abstract class ICommentDataSource {
  Future<void> getComments();
}

class CommentDataSource extends ICommentDataSource {
  final Dio _dio;

  CommentDataSource(this._dio);

  @override
  Future<void> getComments() async {
    try {
      var box = Hive.box<CommentEntity>(HiveBoxConstants.commentsBox);
      List<CommentEntity> comments = <CommentEntity>[];
      if (box.values.isEmpty) {
        var response = await _dio.get("comments/");
        var commentList =
            response.data as List<dynamic>;
        log("${commentList.map((x) => x)}");
        for (var item in commentList) {
          comments.add(
            CommentEntity(
              postId: item["postId"],
              id: item["id"],
              name: item["name"],
              email: item["email"],
              body: item["body"],
            ),
          );
        }
        // List<CommentEntity> comments =
        //     response.data.map<CommentEntity>((map) => CommentEntity.fromJson(map));
        // List<CommentEntity> comments = response.data
        //     .map<CommentEntity>(
        //         (jsonObject) => CommentEntity.fromJson(jsonObject))
        //     .toList;
        for (CommentEntity comment in comments) {
          box.add(comment);
        }
      }
    } catch (ex) {
      throw Exception("$ex");
    }
  }
}
