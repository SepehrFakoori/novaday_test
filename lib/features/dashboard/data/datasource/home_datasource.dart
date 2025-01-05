import 'package:dio/dio.dart';

abstract class IHomeDataSource {
  Future<void> addPost();

  Future<void> addComment(int postId);
}

class HomeDataSource extends IHomeDataSource {
  final Dio _dio;

  HomeDataSource(this._dio);

  @override
  Future<void> addPost() async {
    try {
      final Map<String, dynamic> data = {
        'title': 'SALAM',
        'body': 'THIS IS BODY',
        'userId': 1
      };
      await _dio.post("posts/", data: data);
    } catch (ex) {
      throw Exception(ex);
    }
  }

  @override
  Future<void> addComment(int postId) async {
    try {
      final Map<String, dynamic> data = {
        'postId': postId,
        'title': 'SALAM',
        'body': 'THIS IS BODY',
        'userId': 1
      };
      await _dio.post("comments/", data: data);
    } catch (ex) {
      throw Exception(ex);
    }
  }
}
