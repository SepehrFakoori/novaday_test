import 'package:dio/dio.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';

abstract class ICommentDataSource {
  Future<List<CommentEntity>> getComments();
}

class CommentRemoteDataSource extends ICommentDataSource {
  final Dio _dio =
      Dio(BaseOptions(baseUrl: "https://jsonplaceholder.typicode.com/"));

  @override
  Future<List<CommentEntity>> getComments() async {
    try {
      var response = await _dio.get("comments/");
      return response.data
          .map<CommentEntity>(
              (jsonObject) => CommentEntity.fromJson(jsonObject))
          .toList;
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
