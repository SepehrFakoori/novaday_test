import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

@freezed
class UserModel extends Equatable with _$UserModel {
  const UserModel._();

  factory UserModel({
    String? fullName,
    String? password,
    String? jobTitle,
    String? profileImage,
  }) = _UserModel;

  @override
  List<Object?> get props => [fullName, password, jobTitle, profileImage];
}
