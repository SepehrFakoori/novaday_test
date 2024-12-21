import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_sizes.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/theme/app_colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/header_widget.dart';
import 'package:novaday_test/core/widgets/snack_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_state.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final AppLocalizations localization = AppLocalizations.of(context)!;
    final double appBarHeight = MediaQuery.paddingOf(context).top;

    final focusNodes = List.generate(4, (_) => FocusNode());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              return Column(
                children: [
                  HeaderWidget(
                    haveBackButton: false,
                    title: localization.authTitle,
                    subtitle: localization.authSubtitle("+9301914321"),
                  ),
                  const SizedBox(height: AppSpacing.sp24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      4,
                      (index) => myInputBox(
                        context,
                        focusNodes,
                        index,
                        state,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sp40),
                  Text(
                    '00:59',
                    style: AppTextStyles.textTheme.titleLarge!.copyWith(
                      color: AppColors.lightTitleColor,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      localization.otpSendCodeAgain,
                      style: AppTextStyles.textTheme.titleLarge!.copyWith(
                        color: AppColors.lightTitleColor,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FilledButtonWidget(
                    buttonText: localization.continueButtonTitle,
                    onPressed: () {
                      print("Height ---------> $appBarHeight}");
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          elevation: 0,
                          content: const SnackBarWidget(),
                          behavior: SnackBarBehavior.floating,
                          backgroundColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          margin: EdgeInsets.only(
                            bottom: AppSizes.phoneHeight - appBarHeight * 4,
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget myInputBox(
  BuildContext context,
  List<FocusNode> focusNodes,
  int index,
  OtpState state,
) {
  return Container(
    height: AppHeight.h48,
    width: AppHeight.h48,
    decoration: BoxDecoration(
      color: AppColors.lightBgSecondaryColor,
      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      border: Border.all(
        color: state.enteredFields.contains(index)
            ? AppColors.lightPrimaryColor
            : AppColors.lightDefaultBorderColor,
        width: AppBorderWeight.sm,
      ),
    ),
    child: TextField(
      focusNode: focusNodes[index],
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: AppTextStyles.textTheme.titleLarge!.copyWith(
        color: AppColors.lightSubtitleColor,
      ),
      decoration: const InputDecoration(
        counterText: '',
        border: InputBorder.none,
      ),
      onChanged: (value) {
        if (value.isNotEmpty) {
          context.read<OtpCubit>().updateField(index);
          if (index <= focusNodes.length) {
            if (index - 1 >= 0) {
              FocusScope.of(context).requestFocus(focusNodes[index - 1]);
            }
          } else {
            focusNodes[index].unfocus();
          }
        }
      },
    ),
  );
}
