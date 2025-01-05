abstract class HomeRepository {
  Future<void> addPost();

  Future<void> addComment(int postId);
}
