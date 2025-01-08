abstract class DashboardRepository {
  Future<void> addPost();

  Future<void> addComment(int postId);
}
