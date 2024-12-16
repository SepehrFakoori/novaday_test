import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:novaday_test/core/theme/app_icons.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppColors.lightBackgroundPrimaryColor,
      body: Stack(
        children: [
          _appLogoSection(),
          _loadingSection(size),
          _appVersionNumberSection(size),
        ],
      ),
    );
  }

  Center _appLogoSection() {
    return Center(
      child: SvgPicture.asset(AppIcons.lightAppLogo),
    );
  }

  Positioned _loadingSection(Size size) {
    return Positioned(
      top: size.height * 0.5 + 45,
      child: SizedBox(
        width: size.width,
        height: size.height * 0.5,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 32,
              height: 32,
              child: CircularProgressIndicator(),
            ),
          ],
        ),
      ),
    );
  }

  Positioned _appVersionNumberSection(Size size) {
    return Positioned(
      bottom: 8,
      child: SizedBox(
        width: size.width,
        child: Center(
          child: Text(
            'نسخه 1.19',
            style: AppTextStyles.textTheme.titleSmall!
                .copyWith(color: AppColors.lightSubtitleColor),
          ),
        ),
      ),
    );
  }
}
