import 'package:novaday_test/features/onboarding/data/datasource/comment_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final ICommentDataSource _commentDataSource;
  final IPostDataSource _postDataSource;

  PostRepositoryImpl(this._commentDataSource, this._postDataSource);

  @override
  Future<List<CommentEntity>> fetchComments() async {
    try {
      var response = await _commentDataSource.getComments();
      return response;
    } catch (ex) {
      throw Exception("Failed!");
    }
  }

  @override
  Future<List<PostEntity>> fetchPosts() async {
    try {
      var response = await _postDataSource.getPosts();
      return response;
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
