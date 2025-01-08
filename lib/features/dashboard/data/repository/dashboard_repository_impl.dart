import 'dart:io';

import 'package:novaday_test/features/dashboard/data/datasource/home_datasource.dart';
import 'package:novaday_test/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl extends DashboardRepository {
  final IDashboardDataSource _dashboardDataSource;

  DashboardRepositoryImpl(this._dashboardDataSource);

  @override
  Future<void> addPost() async {
    try {
      await _dashboardDataSource.addPost();
    } on SocketException {
      throw Exception("Failed");
    }
  }

  @override
  Future<void> addComment(int postId) async {
    try {
      await _dashboardDataSource.addComment(postId);
    } on SocketException {
      throw Exception("Failed");
    }
  }
}
