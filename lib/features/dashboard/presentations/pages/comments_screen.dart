import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/custom_text_field.dart';
import 'package:novaday_test/features/dashboard/presentations/widgets/dashboard_custom_app_bar.dart';

class CommentsScreen extends StatelessWidget {
  const CommentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: SizedBox(
            height: context.height,
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
                      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "نظرات",
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: AppHeight.h24),
                        Expanded(
                          child: ListView.builder(
                            itemBuilder: (BuildContext context, int index) {
                              return CommentCard(index: index);
                            },
                            itemCount: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sp12),
                SizedBox(
                  height: 60,
                  width: context.width,
                  child: Row(
                    children: [
                      const Expanded(
                        child: CustomTextField(labelText: 'labelText'),
                      ),
                      const SizedBox(width: AppSpacing.sp8),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.send,
                          color: context.colorScheme.primary,
                        ),
                      ),
                    ],
                  ),
                ),
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
    required this.index,
  });

  final int index;

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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: AppHeight.h32,
                    width: AppHeight.h32,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppBorderRadius.br8),
                      color: context.colorScheme.primary,
                    ),
                    child: Center(
                      child: Text(
                        "${index + 1}",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sp8),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "odio adipisci rerum aut animi",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        "Nikita@garfield.biz",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: context.textTheme.labelLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.sp12),
              Text(
                "quia molestiae reprehenderit quasi aspernatur\naut expedita occaecati aliquam eveniet laudantium\nomnis quibusdam delectus saepe quia accusamus maiores nam est\ncum et ducimus et vero voluptates excepturi deleniti ratione",
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
