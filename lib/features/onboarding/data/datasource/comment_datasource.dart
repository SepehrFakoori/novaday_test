import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';

abstract class ICommentDataSource {
  Future<void> getComments();
}

class CommentDataSource extends ICommentDataSource {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<void> getComments() async {
    var box = Hive.box<CommentEntity>(HiveBoxConstants.commentsBox);
    try {
      if (box.values.isEmpty) {
        var response = await _dio.get("comments/");
        List<CommentEntity> comments = response.data
            .map<CommentEntity>(
                (jsonObject) => CommentEntity.fromJson(jsonObject))
            .toList;
        for (CommentEntity comment in comments) {
          box.add(comment);
        }
      }
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
