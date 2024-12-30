import 'package:dio/dio.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';

abstract class IPostDataSource {
  Future<List<PostEntity>> getPosts();
}

class PostRemoteDataSource extends IPostDataSource {
  final Dio _dio;
  PostRemoteDataSource(this._dio);

  @override
  Future<List<PostEntity>> getPosts() async {
    try {
      var response = await _dio.get("comments/");
      return response.data
          .map<PostEntity>(
              (jsonObject) => PostEntity.fromJson(jsonObject))
          .toList;
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
