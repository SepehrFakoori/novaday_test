import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final PostRepository postRepository;

  SplashCubit(this.postRepository) : super(const SplashState.initialState()) {
    checkUserRegistration();
  }

  Future<void> checkUserRegistration() async {
    try {
      final box = Hive.box(HiveBoxConstants.settingBox);
      final String theme = await box.get(HiveKeyConstants.themeKey);
      if (theme.isNotEmpty) {
        emit(const SplashState.userRegistered());
      } else {
        emit(const SplashState.userNotRegistered());
      }
    } catch (ex) {
      emit(const SplashState.userNotRegistered());
    }
  }

  Future<void> checkBiometricStatus() async {
    try {
      final box = Hive.box(HiveBoxConstants.settingBox);
      final bool isEnabled = box.get(HiveKeyConstants.biometricAuthKey);
      if (isEnabled) {
        emit(const SplashState.biometricAuthIsOn());
      } else {
        emit(const SplashState.biometricAuthIsOff());
      }
    } catch (ex) {
      emit(const SplashState.biometricAuthIsOff());
    }
  }

  Future<void> checkData() async {
    try {
      var commentBox = Hive.box<CommentEntity>(HiveBoxConstants.commentsBox);
      var postBox = Hive.box<PostEntity>(HiveBoxConstants.postsBox);
      if (commentBox.values.isEmpty && postBox.values.isEmpty) {
        emit(const SplashState.dataIsNotInDatabase());
      } else {
        emit(const SplashState.dataIsInDatabase());
      }
    } catch (ex) {
      emit(const SplashState.dataIsNotInDatabase());
    }
  }

  Future<void> getData() async {
    try {
      postRepository.fetchComments();
        postRepository.fetchPosts();
    } catch (ex) {
      print(ex);
      emit(const SplashState.noInternetConnection());
    }
  }
}
