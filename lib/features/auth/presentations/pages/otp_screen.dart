import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_height.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/enums/button_state_enum.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/size_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/filled_button_widget.dart';
import 'package:novaday_test/core/widgets/custom_app_bar_widget.dart';
import 'package:novaday_test/core/widgets/snack_bar_widget.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_state.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  CustomAppBarWidget(
                    haveBackButton: false,
                    title: context.localization.authTitle,
                    subtitle: context.localization.authSubtitle("+9301914321"),
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
                      color: context.colorScheme.onSurface,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      context.localization.otpSendCodeAgain,
                      style: AppTextStyles.textTheme.titleLarge!.copyWith(
                        color: context.colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const Spacer(),
                  FilledButtonWidget(
                    buttonText: context.localization.continueButtonTitle,
                    buttonState: ButtonStateEnum.active,
                    onPressed: () {
                      customFlushBar(context);
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
      color: context.colorScheme.secondary,
      borderRadius: BorderRadius.circular(AppBorderRadius.br12),
      border: Border.all(
        color: state.enteredFields.contains(index)
            ? context.colorScheme.primary
            : context.colorScheme.outline,
        width: AppBorderWeight.sm,
      ),
    ),
    child: TextField(
      focusNode: focusNodes[index],
      maxLength: 1,
      textAlign: TextAlign.center,
      keyboardType: TextInputType.number,
      style: AppTextStyles.textTheme.titleLarge!.copyWith(
        color: context.colorScheme.onSecondaryContainer,
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
