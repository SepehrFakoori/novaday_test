import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
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
      List<PostEntity> posts = <PostEntity>[];
      if (box.values.isEmpty) {
        var response = await _dio.get("posts/");
        var postList = response.data as List<dynamic>;
        log("${postList.map((x) => x)}");
        for (var item in postList) {
          posts.add(
            PostEntity(
              userId: item["userId"],
              id: item["id"],
              title: item["title"],
              body: item["body"],
            ),
          );
        }
        // List<PostEntity> posts =
        // response.data.map<PostEntity>((map) => PostEntity.fromJson(map));
        // List<PostEntity> posts =  response.data
        //     .map<PostEntity>((jsonObject) => PostEntity.fromJson(jsonObject))
        //     .toList;
        for (PostEntity post in posts) {
          box.add(post);
        }
      }
    } catch (ex) {
      throw Exception("$ex");
    }
  }
}
