import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'post_model.freezed.dart';

@freezed
class PostModel extends Equatable with _$PostModel {
  const PostModel._();

  factory PostModel({
    int? userId,
    int? id,
    String? title,
    String? body,
  }) = _PostModel;

  @override
  List<Object?> get props => [userId, id, title, body];
}
