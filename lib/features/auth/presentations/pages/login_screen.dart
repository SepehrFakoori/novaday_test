import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/auth/presentations/widgets/phone_entry_text_field_widget.dart';
import 'package:novaday_test/features/auth/presentations/widgets/select_country_bottom_sheet.dart';
import 'package:novaday_test/features/onboarding/domain/entities/country_entity.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  late FocusNode _focusNode;

  CountryEntity selectedCountry = CountryEntity(
    countryName: "فارسی",
    countryLanguage: "Persian",
    countryLanguageCode: LanguageEnum.fa,
    countryFlag: AppIcons.iranFlag,
    countryCode: 98,
    phoneNumberLength: 10,
  );

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

  void showCountryCodeBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return SelectCountryBottomSheet(
          onCountrySelected: (country) {
            setState(
              () {
                selectedCountry = country;
              },
            );
          },
        );
      },
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      customFlushBar(
        context,
        messageText: 'Success',
        isError: false,
      );
      Navigator.pushReplacementNamed(context, AppRoutes.otpScreen);
    } else {
      customFlushBar(
        context,
        messageText: 'Please fix the errors',
        isError: true,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController phoneController = TextEditingController();

    return Form(
      key: _formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppLayoutGrid.margin),
            child: Column(
              children: [
                CustomAppBar(title: context.localization.loginRegisterTitle),
                const SizedBox(height: AppSpacing.sp24),
                Directionality(
                  textDirection: TextDirection.rtl,
                  child: Container(
                    width: context.width,
                    height: AppHeight.h48,
                    padding: const EdgeInsets.all(AppSpacing.sp4),
                    decoration: BoxDecoration(
                      color: context.colorScheme.secondary,
                      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
                      border: Border.all(
                        color: context.colorScheme.outline,
                        width: AppBorderWeight.sm,
                      ),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: PhoneEntryTextFieldWidget(
                            controller: phoneController,
                            hintText: '9301914321',
                            phoneNumberLength:
                                selectedCountry.phoneNumberLength!,
                          ),
                        ),
                        const SizedBox(width: AppSpacing.sp8),
                        GestureDetector(
                          onTap: () {
                            showCountryCodeBottomSheet();
                          },
                          child: Container(
                            height: AppHeight.h40,
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
                                  "${selectedCountry.countryCode}+",
                                  style:
                                      context.textTheme.titleMedium!.copyWith(
                                    fontSize: 18,
                                  ),
                                ),
                                const SizedBox(width: AppSpacing.sp12),
                                SvgPicture.asset(selectedCountry.countryFlag!),
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
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFilledButton(
          buttonText: context.localization.continueButtonTitle,
          buttonState: ButtonStateEnum.active,
          onPressed: () {
            _submitForm();
          },
        ),
      ),
    );
  }
}
