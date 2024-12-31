abstract class PostRepository {
  Future<void> fetchPosts();

  Future<void> fetchComments();
}
