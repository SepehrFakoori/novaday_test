import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/utils/language_manager.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';

class SelectCountryBottomSheet extends StatelessWidget {
  const SelectCountryBottomSheet({super.key, required this.onCountrySelected});

  final ValueChanged<CountryEntity> onCountrySelected;

  @override
  Widget build(BuildContext context) {
    final List<CountryEntity> countries = LanguageManagerUtils.allLanguages;

    return Container(
      width: context.width,
      margin: const EdgeInsets.only(
        bottom: AppSpacing.sp16,
        left: AppSpacing.sp16,
        right: AppSpacing.sp16,
      ),
      decoration: BoxDecoration(
        color: context.colorScheme.secondary,
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(AppBorderRadius.br12),
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            final CountryEntity country = countries[index];
            return GestureDetector(
              onTap: () {
                onCountrySelected(country);
                Navigator.pop(context);
              },
              child: Container(
                height: AppHeight.h48,
                decoration: BoxDecoration(
                  color: context.colorScheme.secondary,
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
                    SvgPicture.asset(country.countryFlag!),
                    const SizedBox(width: AppSpacing.sp16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            country.countryLanguage!,
                            style:
                                context.textTheme.titleMedium!.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                          Text(
                            '+${country.countryCode.toString()}',
                            style:
                                context.textTheme.labelLarge!.copyWith(
                              color: context.colorScheme.onSecondaryContainer,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          itemCount: countries.length,
        ),
      ),
    );
  }
}
