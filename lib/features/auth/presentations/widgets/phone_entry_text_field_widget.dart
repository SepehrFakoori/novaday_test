import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';

class PhoneTextField extends StatefulWidget {
  const PhoneTextField({
    super.key,
    required this.controller,
    required this.showSelectCountryBottomSheet,
    required this.selectedCountry,
    required this.onChanged,
  });

  final TextEditingController controller;
  final void Function() showSelectCountryBottomSheet;
  final CountryEntity selectedCountry;
  final ValueChanged<String> onChanged;

  @override
  State<PhoneTextField> createState() => _PhoneTextFieldState();
}

class _PhoneTextFieldState extends State<PhoneTextField> {
  late FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: TextFormField(
        controller: widget.controller,
        focusNode: _focusNode,
        textDirection: TextDirection.ltr,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.phone,
        style: context.textTheme.titleMedium!.copyWith(
          color: context.colorScheme.onSecondary,
          fontSize: 18,
        ),
        enableSuggestions: false,
        decoration: InputDecoration(
          filled: true,
          fillColor: context.colorScheme.secondary,
          hintText: "0000000000",
          hintStyle: context.textTheme.titleMedium!.copyWith(
            color: context.colorScheme.onTertiaryContainer.withOpacity(0.48),
            fontSize: 18,
          ),
          errorStyle: context.textTheme.labelMedium!.copyWith(
            color: context.colorScheme.error,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
            borderSide: BorderSide(
              color: context.colorScheme.error,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
            borderSide: BorderSide(
              color: context.colorScheme.primary,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppBorderRadius.br12),
            borderSide: BorderSide(
              color: context.colorScheme.outline,
            ),
          ),
          prefixIcon: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: GestureDetector(
                onTap: () {
                  widget.showSelectCountryBottomSheet();
                },
                child: Container(
                  height: AppHeight.h40,
                  constraints: const BoxConstraints(
                    maxWidth: 142,
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.sp16,
                    vertical: AppSpacing.sp8,
                  ),
                  decoration: BoxDecoration(
                    color: context.colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(
                      AppBorderRadius.br8,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down_rounded,
                        size: AppHeight.h24,
                        color: context.colorScheme.onSurface,
                      ),
                      const SizedBox(width: AppSpacing.sp12),
                      Text(
                        "${widget.selectedCountry.countryCode}+",
                        style: context.textTheme.titleMedium!.copyWith(
                          color: context.colorScheme.onSecondary,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.sp12),
                      SvgPicture.asset(widget.selectedCountry.countryFlag!),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        inputFormatters: [
          FilteringTextInputFormatter.digitsOnly,
          LengthLimitingTextInputFormatter(
              widget.selectedCountry.phoneNumberLength),
        ],
        onChanged: widget.onChanged,
      ),
    );
  }
}
