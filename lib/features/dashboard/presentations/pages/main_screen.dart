import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kiwi/kiwi.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/features/dashboard/domain/repository/home_repository.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/home_screen.dart';
import 'package:novaday_test/features/dashboard/presentations/pages/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    KiwiContainer di = KiwiContainer();

    return Scaffold(
      bottomNavigationBar: SizedBox(
        width: context.width,
        height: AppHeight.h68,
        child: Row(
          children: [
            Expanded(
              child: InkWell(
                onTap: () {
                  _onTappedBar(0);
                },
                child: selectedIndex == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sp12,
                              vertical: AppSpacing.sp4 + 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.br12),
                              color: context.colorScheme.secondaryContainer,
                            ),
                            child: SvgPicture.asset(AppIcons.homeActive),
                          ),
                          const SizedBox(height: AppSpacing.sp4),
                          Text(
                            context.localization.home,
                            style: context.textTheme.labelMedium!.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sp12,
                              vertical: AppSpacing.sp4 + 2,
                            ),
                            child: SvgPicture.asset(AppIcons.homeDeActive),
                          ),
                          const SizedBox(height: AppSpacing.sp4),
                          Text(
                            context.localization.home,
                            style: context.textTheme.labelMedium!.copyWith(
                              color: context.colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
            Expanded(
              child: InkWell(
                onTap: () {
                  _onTappedBar(1);
                },
                child: selectedIndex == 1
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sp12,
                              vertical: AppSpacing.sp4 + 2,
                            ),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.br12),
                              color: context.colorScheme.secondaryContainer,
                            ),
                            child: Icon(
                              Icons.settings,
                              color: context.colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sp4),
                          Text(
                            context.localization.settings,
                            style: context.textTheme.labelMedium!.copyWith(
                              color: context.colorScheme.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 48,
                            height: 32,
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSpacing.sp12,
                              vertical: AppSpacing.sp4 + 2,
                            ),
                            child: Icon(
                              Icons.settings,
                              color: context.colorScheme.onSecondaryContainer,
                            ),
                          ),
                          const SizedBox(height: AppSpacing.sp4),
                          Text(
                            context.localization.settings,
                            style: context.textTheme.labelMedium!.copyWith(
                              color: context.colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        children: [
          HomeScreen(
            homeRepository: di.resolve<HomeRepository>(),
          ),
          const SettingsScreen(),
        ],
        onPageChanged: (page) {
          setState(
            () {
              selectedIndex = page;
            },
          );
        },
      ),
    );
  }

  void _onTappedBar(int value) {
    setState(() {
      selectedIndex = value;
    });
    _pageController.jumpToPage(value);
  }
}
