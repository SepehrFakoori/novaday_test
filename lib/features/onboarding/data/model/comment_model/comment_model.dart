import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';

@freezed
class CommentModel extends Equatable with _$CommentModel {
  const CommentModel._();

  factory CommentModel({
    int? postId,
    int? id,
    String? name,
    String? email,
    String? body,
  }) = _CommentModel;

  @override
  List<Object?> get props => [postId, id, name, email, body];
}
