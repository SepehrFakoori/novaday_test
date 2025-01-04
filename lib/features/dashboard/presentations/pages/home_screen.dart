import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/features/dashboard/presentations/widgets/dashboard_custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const DashboardCustomAppBar(),
              const SizedBox(height: AppSpacing.sp24),
              Container(
                width: context.width,
                height: 400,
                padding: const EdgeInsets.all(AppLayoutGrid.margin),
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
                  borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "پست ها",
                          style: context.textTheme.titleMedium!.copyWith(
                            fontSize: 18,
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: AppHeight.h16,
                        ),
                      ],
                    ),
                    const SizedBox(height: AppHeight.h24),
                    SizedBox(
                      height: 310,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return SizedBox(
                            width: 178,
                            child: Card(
                              color: context.colorScheme.secondary,
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.br12),
                                side: BorderSide(
                                  color: context.colorScheme.outline,
                                ),
                              ),
                              child: const Padding(
                                padding: EdgeInsets.all(
                                  AppLayoutGrid.count,
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: AppSpacing.sp12),
                                    Text(
                                      "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto",
                                      textAlign: TextAlign.justify,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
