import 'package:novaday_test/features/dashboard/data/datasource/home_datasource.dart';
import 'package:novaday_test/features/dashboard/domain/repository/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  final IHomeDataSource _homeDataSource;

  HomeRepositoryImpl(this._homeDataSource);

  @override
  Future<void> addPost() async {
    try {
      await _homeDataSource.addPost();
    } catch (ex) {
      throw Exception("Failed");
    }
  }

  @override
  Future<void> addComment(int postId) async {
    try {
      await _homeDataSource.addComment(postId);
    } catch (ex) {
      throw Exception("Failed!");
    }
  }
}
