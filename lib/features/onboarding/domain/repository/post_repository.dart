import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts();

  Future<List<CommentEntity>> fetchComments();
}
