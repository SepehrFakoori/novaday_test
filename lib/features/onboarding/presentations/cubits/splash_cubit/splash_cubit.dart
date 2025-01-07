import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';
import 'package:novaday_test/features/onboarding/domain/entities/user_entity/user_entity.dart';
import 'package:novaday_test/features/onboarding/domain/repository/post_repository.dart';
import 'package:novaday_test/features/onboarding/presentations/cubits/splash_cubit/splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  final PostRepository postRepository;

  SplashCubit(this.postRepository) : super(const SplashState.initialState()) {
    checkUserRegistration();
  }

  Future<void> checkUserRegistration() async {
    try {
      final box = Hive.box<UserEntity>(HiveBoxConstants.userProfileBox);
      final UserEntity? user = await box.get(HiveKeyConstants.userProfileKey);
      final String fullName = user!.fullName ?? "";
      if (fullName.isEmpty) {
        emit(const SplashState.userNotRegistered());
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
      emit(const SplashState.noInternetConnection());
    }
  }
}
