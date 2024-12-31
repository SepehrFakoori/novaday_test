import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

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
              Row(
                children: [
                  SizedBox(
                    width: 60,
                    child: Stack(
                      alignment: AlignmentDirectional.centerEnd,
                      children: [
                        SizedBox.square(
                          dimension: AppHeight.h40,
                          child: Container(
                            decoration: BoxDecoration(
                              color: context.colorScheme.primary,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: context.colorScheme.outline,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "m".toUpperCase(),
                                style: context.textTheme.titleMedium!.copyWith(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: context.colorScheme.onPrimary,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 0,
                          child: Container(
                            width: AppHeight.h40,
                            height: AppHeight.h40,
                            decoration: BoxDecoration(
                              // todo: change color
                              color: Colors.white,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: context.colorScheme.outline,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppBorderRadius.br24),
                              child: Image.asset("assets/mark.png"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: AppSpacing.sp12),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "مصطفی گریزمان",
                        style: context.textTheme.titleMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSurface,
                        ),
                      ),
                      Text(
                        "شرکت نوادی",
                        style: context.textTheme.labelMedium!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: context.colorScheme.onSecondaryContainer,
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  Container(
                    width: AppHeight.h40,
                    height: AppHeight.h40,
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.notifications_none_rounded,
                        color: context.colorScheme.onSecondary,
                      ),
                    ),
                  ),
                ],
              ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "فضاها",
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
                        height: AppHeight.h80,
                        child: Card(
                          color: context.colorScheme.secondary,
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.br12),
                            side: BorderSide(
                              color: context.colorScheme.outline,
                            ),
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
    );
  }
}
