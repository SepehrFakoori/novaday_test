import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/NavigateProfileFromEnum.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                CustomAppBar(
                  centerTitle: true,
                  haveBackButton: false,
                  title: context.localization.settings,
                ),
                const SizedBox(height: AppSpacing.sp24),
                Text(
                  context.localization.profile,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.sp4),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.profileScreen,
                      arguments: NavigateProfileFromEnum.dashboard,
                    );
                  },
                  child: Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      border: Border.all(
                        color: context.colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                    ),
                    child: Container(
                      height: AppHeight.h48,
                      decoration: BoxDecoration(
                        color: context.colorScheme.secondary,
                        borderRadius:
                            BorderRadius.circular(AppBorderRadius.br16),
                        border: Border(
                          bottom: BorderSide(
                            color: context.colorScheme.outline,
                            width: AppBorderWeight.sm,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppLayoutGrid.margin,
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.person,
                            color: context.colorScheme.primary,
                          ),
                          const SizedBox(width: AppSpacing.sp16),
                          Expanded(
                            child: Text(
                              context.localization.profile,
                              style: context.textTheme.titleMedium!.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: AppSpacing.sp24),
                Text(
                  context.localization.settings,
                  style: context.textTheme.titleMedium!.copyWith(
                    color: context.colorScheme.onSurface,
                  ),
                ),
                const SizedBox(height: AppSpacing.sp4),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                  child: Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      border: Border.all(
                        color: context.colorScheme.outline,
                      ),
                      borderRadius: BorderRadius.circular(AppBorderRadius.br16),
                    ),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.setThemeScreen,
                              arguments: NavigateProfileFromEnum.dashboard,
                            );
                          },
                          child: Container(
                            height: AppHeight.h48,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(AppBorderRadius.br16),
                                topRight: Radius.circular(AppBorderRadius.br16),
                              ),
                              border: Border(
                                bottom: BorderSide(
                                  color: context.colorScheme.outline,
                                  width: AppBorderWeight.sm,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppLayoutGrid.margin,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.light_mode,
                                  color: context.colorScheme.primary,
                                ),
                                const SizedBox(width: AppSpacing.sp16),
                                Expanded(
                                  child: Text(
                                    context.localization.setThemeTitle,
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      color: context.colorScheme.onSurface,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              AppRoutes.setLocaleScreen,
                              arguments: NavigateProfileFromEnum.dashboard,
                            );
                          },
                          child: Container(
                            height: AppHeight.h48,
                            decoration: BoxDecoration(
                              color: context.colorScheme.secondary,
                              borderRadius: const BorderRadius.only(
                                bottomLeft:
                                    Radius.circular(AppBorderRadius.br16),
                                bottomRight:
                                    Radius.circular(AppBorderRadius.br16),
                              ),
                              border: Border(
                                bottom: BorderSide(
                                  color: context.colorScheme.outline,
                                  width: AppBorderWeight.sm,
                                ),
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppLayoutGrid.margin,
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.language,
                                  color: context.colorScheme.primary,
                                ),
                                const SizedBox(width: AppSpacing.sp16),
                                Expanded(
                                  child: Text(
                                    context.localization.setLangTitle,
                                    style:
                                        context.textTheme.titleMedium!.copyWith(
                                      color: context.colorScheme.onSurface,
                                    ),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
