import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/dashboard/domain/repository/home_repository.dart';
import 'package:novaday_test/features/dashboard/presentations/widgets/comment_input_custom_text_field.dart';
import 'package:novaday_test/features/dashboard/presentations/widgets/dashboard_custom_app_bar.dart';
import 'package:novaday_test/features/onboarding/domain/entities/comment_entity/comment_entity.dart';

class CommentsScreen extends StatelessWidget {
  final HomeRepository homeRepository;

  const CommentsScreen(
      {super.key, required this.postId, required this.homeRepository});

  final int postId;

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<CommentEntity>(HiveBoxConstants.commentsBox);
    List<CommentEntity> commentList = box.values.toList();
    List<CommentEntity> postCommentList =
        commentList.where((CommentEntity comment) {
      return comment.postId == postId;
    }).toList();

    void onSendComment() {
      homeRepository
          .addComment(postId)
          .then(
            (_) async {
              var box = Hive.box<bool>(HiveBoxConstants.settingBox);
              await box.put(HiveKeyConstants.dataKey, true);
              return customFlushBar(context,
                messageText: context.localization.postAddedSuccessfully,
                isError: false);
            },
          );
    }

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: SizedBox(
            height: context.height,
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      const DashboardCustomAppBar(),
                      const SizedBox(height: AppSpacing.sp24),
                      Expanded(
                        child: Container(
                          width: context.width,
                          padding: const EdgeInsets.all(AppLayoutGrid.margin),
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.br12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                context.localization.comments,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                              const SizedBox(height: AppHeight.h24),
                              Expanded(
                                child: ListView.builder(
                                  itemBuilder: (context, index) {
                                    CommentEntity comment =
                                        postCommentList[index];
                                    return CommentCard(comment: comment);
                                  },
                                  itemCount: postCommentList.length,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sp12),
                    ],
                  ),
                ),
                CommentInputCustomTextField(onSendComment: onSendComment),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CommentCard extends StatelessWidget {
  const CommentCard({
    super.key,
    required this.comment,
  });

  final CommentEntity comment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      child: Card(
        color: context.colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppBorderRadius.br12),
          side: BorderSide(
            color: context.colorScheme.outline,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(
            AppLayoutGrid.count,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: context.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: AppHeight.h32,
                      width: AppHeight.h32,
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.br8),
                        color: context.colorScheme.primary,
                      ),
                      child: Center(
                        child: Text(
                          "${comment.id}",
                          style: context.textTheme.titleMedium!.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: AppSpacing.sp8),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${comment.name}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.titleMedium!.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            "${comment.email}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: context.textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w600,
                              color: context.colorScheme.onSecondaryContainer,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.sp12),
              Text(
                "${comment.body}",
                textAlign: TextAlign.start,
                style: context.textTheme.bodyMedium!.copyWith(
                  color: context.colorScheme.onSurface,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
