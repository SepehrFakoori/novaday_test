import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/auth/presentations/utils/login_arguments.dart';
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

  ButtonStateEnum buttonState = ButtonStateEnum.deActive;
  final isShowButton = ValueNotifier<ButtonStateEnum>(ButtonStateEnum.deActive);

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

  void _submitForm(String countryCode, String phoneNumber) {
    if (_formKey.currentState?.validate() ?? false) {
      _formKey.currentState?.save();
      Navigator.pushReplacementNamed(
        context,
        AppRoutes.otpScreen,
        arguments:
            LoginArguments(countryCode: countryCode, phoneNumber: phoneNumber),
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
                PhoneTextField(
                  controller: phoneController,
                  showSelectCountryBottomSheet: showCountryCodeBottomSheet,
                  selectedCountry: selectedCountry,
                  onChanged: (String value) {
                    if(value.isNotEmpty) {
                      if(value.length >= 7) {
                        if (value.length <
                            selectedCountry.phoneNumberLength!.toInt()) {
                        //  buttonState = ButtonStateEnum.deActive;
                          isShowButton.value = ButtonStateEnum.deActive;
                        }
                        isShowButton.value = ButtonStateEnum.active;
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: ValueListenableBuilder(valueListenable: isShowButton, builder: (context, value, child) {
          return CustomFilledButton(
            buttonText: context.localization.continueButtonTitle,
            buttonState: value,
            onPressed: () {
              _submitForm(
                selectedCountry.countryCode.toString(),
                phoneController.text,
              );
            },
          );
        },),
      ),
    );
  }
}
