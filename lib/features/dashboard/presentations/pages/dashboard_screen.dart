import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_box_constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/widgets/custom_snack_bar.dart';
import 'package:novaday_test/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:novaday_test/features/dashboard/presentations/widgets/dashboard_custom_app_bar.dart';
import 'package:novaday_test/features/onboarding/domain/entities/post_entity/post_entity.dart';
import 'package:share_plus/share_plus.dart';

class DashboardScreen extends StatelessWidget {
  final DashboardRepository dashboardRepository;

  const DashboardScreen({super.key, required this.dashboardRepository});

  @override
  Widget build(BuildContext context) {
    var box = Hive.box<PostEntity>(HiveBoxConstants.postsBox);
    List<PostEntity> postList = box.values.toList();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: SizedBox(
            height: context.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const DashboardCustomAppBar(),
                const SizedBox(height: AppSpacing.sp24),
                Expanded(
                  child: Container(
                    width: context.width,
                    padding: const EdgeInsets.all(AppLayoutGrid.margin),
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                context.localization.posts,
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  color: context.colorScheme.onSurface,
                                ),
                              ),
                            ),
                            IconButton(
                              onPressed: () => showSearch(
                                context: context,
                                delegate: PostSearchDelegate(context,
                                    postList: postList),
                              ),
                              icon: const Icon(Icons.search),
                            ),
                          ],
                        ),
                        const SizedBox(height: AppHeight.h24),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              PostEntity post = postList[index];
                              return PostCard(post: post);
                            },
                            itemCount: postList.length,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: context.colorScheme.primary,
        onPressed: () {
          dashboardRepository.addPost().then(
            (_) async {
              // var box = Hive.box<bool>(HiveBoxConstants.settingBox);
              // await box.put(HiveKeyConstants.dataKey, true);
              return customFlushBar(
                context,
                messageText: context.localization.postAddedSuccessfully,
                isError: false,
              );
            },
          );
        },
        label: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.add,
              color: context.colorScheme.onPrimary,
            ),
            const SizedBox(width: AppSpacing.sp4),
            Text(
              context.localization.addPost,
              style: context.textTheme.titleMedium!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onPrimary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PostCard extends StatelessWidget {
  const PostCard({
    super.key,
    required this.post,
  });

  final PostEntity post;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        Share.share(post.body!, subject: post.title);
      },
      onTap: () {
        Navigator.pushNamed(
          context,
          AppRoutes.commentScreen,
          arguments: post.id,
        );
      },
      child: SizedBox(
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
                Text("${post.title}",
                    style: context.textTheme.titleMedium!.copyWith(
                      color: context.colorScheme.onSurface,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
                const Divider(),
                const SizedBox(height: AppSpacing.sp12),
                Text(
                  "${post.body}".replaceAll("\n", " "),
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.start,
                  maxLines: null,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PostSearchDelegate extends SearchDelegate {
  final List<PostEntity> postList;
  final BuildContext context;
  List<PostEntity> results = <PostEntity>[];

  PostSearchDelegate(this.context, {required this.postList});

  @override
  TextStyle? get searchFieldStyle => context.textTheme.titleLarge!.copyWith(
        color: context.colorScheme.onSecondary,
      );

  @override
  List<Widget>? buildActions(BuildContext context) => [
        query.isNotEmpty
            ? IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () =>
                    query.isEmpty ? close(context, null) : query = '',
              )
            : const SizedBox(),
      ];

  @override
  Widget? buildLeading(BuildContext context) => IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => close(context, null),
      );

  @override
  Widget buildResults(BuildContext context) => results.isEmpty
      ? Center(
          child: Text(
            context.localization.noResult,
            style: context.textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: context.colorScheme.onSurface,
            ),
          ),
        )
      : Padding(
          padding: const EdgeInsets.all(AppSpacing.sp8),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return PostCard(post: results[index]);
            },
            itemCount: results.length,
          ),
        );

  @override
  Widget buildSuggestions(BuildContext context) {
    results = postList.where((PostEntity post) {
      final String title = post.title!.toLowerCase();
      final String body = post.body!.toLowerCase();
      final String input = query.toLowerCase();
      return title.contains(input) || body.contains(input);
    }).toList();

    return results.isEmpty
        ? Center(
            child: Text(
              context.localization.noResult,
              style: context.textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: context.colorScheme.onSurface,
              ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(AppSpacing.sp8),
            child: ListView.builder(
              itemBuilder: (context, index) {
                return PostCard(post: results[index]);
              },
              itemCount: results.length,
            ),
          );
  }
}
