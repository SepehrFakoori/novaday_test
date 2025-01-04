import 'package:freezed_annotation/freezed_annotation.dart';

part 'splash_state.freezed.dart';

@freezed
class SplashState with _$SplashState {
  const factory SplashState.initialState() = InitialState;

  const factory SplashState.userRegistered() = UserRegistered;

  const factory SplashState.userNotRegistered() = UserNotRegistered;

  const factory SplashState.biometricAuthIsOn() = BiometricAuthIsOn;

  const factory SplashState.biometricAuthIsOff() = BiometricAuthIsOff;

  const factory SplashState.dataIsInDatabase() = DataIsInDatabase;

  const factory SplashState.dataIsNotInDatabase() = DataIsNotInDatabase;

  const factory SplashState.noInternetConnection() = NoInternetConnection;
}
