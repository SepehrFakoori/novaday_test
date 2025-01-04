import 'package:novaday_test/features/onboarding/data/datasource/comment_datasource.dart';
import 'package:novaday_test/features/onboarding/data/datasource/post_datasource.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';

class PostRepositoryImpl extends PostRepository {
  final ICommentDataSource _commentDataSource;
  final IPostDataSource _postDataSource;

  PostRepositoryImpl(this._commentDataSource, this._postDataSource);

  @override
  Future<void> fetchComments() async {
    try {
      await _commentDataSource.getComments();
    } catch (ex) {
      throw Exception("Failed!");
    }
  }

  @override
  Future<void> fetchPosts() async {
    try {
      await _postDataSource.getPosts();
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
