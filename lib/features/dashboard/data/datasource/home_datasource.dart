
import 'package:dio/dio.dart';

abstract class IDashboardDataSource {
  Future<void> addPost();

  Future<void> addComment(int postId);
}

class DashboardDataSource extends IDashboardDataSource {
  final Dio _dio;

  DashboardDataSource(this._dio);

  @override
  Future<void> addPost() async {
    try {
      final Map<String, dynamic> data = {
        'title': 'SALAM',
        'body': 'THIS IS BODY',
        'userId': 1
      };
      await _dio.post("posts/", data: data);
    } on Exception catch (ex) {
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
    } on Exception catch (ex) {
      throw Exception(ex);
    }
  }
}
