import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/theme/app_text_styles.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_state.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  int _remainingSeconds = AppConstants.timerCount;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_remainingSeconds > 1) {
        setState(() {
          _remainingSeconds--;
        });
      } else {
        setState(() {
          _isButtonVisible = true;
        });
        _timer.cancel();
      }
    });
  }

  String _formatTime(int seconds) {
    final minutes = seconds ~/ 60;
    final secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final focusNodes = List.generate(4, (_) => FocusNode());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: BlocBuilder<OtpCubit, OtpState>(
            builder: (context, state) {
              return Column(
                children: [
                  CustomAppBar(
                    haveBackButton: false,
                    title: context.localization.authTitle,
                    subtitle: context.localization.authSubtitle("+9301914321"),
                  ),
                  const SizedBox(height: AppSpacing.sp24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      4,
                      (index) => Row(
                        children: [
                          myInputBox(
                            context,
                            focusNodes,
                            index,
                            state,
                          ),
                          index == 3
                              ? const SizedBox(width: AppSpacing.sp0)
                              : const SizedBox(width: AppSpacing.sp16),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: AppSpacing.sp40),
                  _isButtonVisible
                      ? TextButton(
                          onPressed: () {
                            setState(() {
                              _isButtonVisible = false;
                              _remainingSeconds = AppConstants.timerCount;
                              _startTimer();
                            });
                          },
                          child: Text(
                            context.localization.otpSendCodeAgain,
                            style: AppTextStyles.textTheme.titleLarge!.copyWith(
                              color: context.colorScheme.onSurface,
                            ),
                          ),
                        )
                      : Text(
                          _formatTime(_remainingSeconds),
                          style: AppTextStyles.textTheme.titleLarge!.copyWith(
                            color: context.colorScheme.onSurface,
                          ),
                        ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFilledButton(
        buttonText: context.localization.continueButtonTitle,
        buttonState: ButtonStateEnum.active,
        onPressed: () {
          if (kIsWeb) {
            Navigator.pushNamed(context, AppRoutes.setLocaleScreen);
          } else {
            Navigator.pushReplacementNamed(
                context, AppRoutes.setBiometricAuthScreen);
          }
        },
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
