import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';

abstract class IPostDataSource {
  Future<void> getPosts();
}

class PostDataSource extends IPostDataSource {
  final Dio _dio;

  PostDataSource(this._dio);

  @override
  Future<void> getPosts() async {
    try {
      var box = Hive.box<PostEntity>(HiveBoxConstants.postsBox);
      if (box.values.isEmpty) {
        var response = await _dio.get("posts/");
        List<PostEntity> posts =  response.data
            .map<PostEntity>((jsonObject) => PostEntity.fromJson(jsonObject))
            .toList;
        for (PostEntity post in posts) {
          box.add(post);
        }
      }
    } catch (ex) {
      throw Exception("Failed! *************************> $ex");
    }
  }
}
