import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_cubit.dart';
import 'package:novaday_test/features/auth/presentations/cubits/otp_state.dart';
import 'package:novaday_test/features/auth/presentations/utils/login_arguments.dart';
import 'package:pinput/pinput.dart';
import 'package:smart_auth/smart_auth.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key, required this.loginArguments});

  // final String phoneNumber;
  // final String countryCode;
  final LoginArguments loginArguments;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late Timer _timer;
  late final SmsRetriever smsRetriever;
  late final TextEditingController pinController;
  late final FocusNode focusNode;
  late final GlobalKey<FormState> formKey;
  int _remainingSeconds = AppConstants.timerCount;
  bool _isButtonVisible = false;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    pinController = TextEditingController();
    focusNode = FocusNode();
    smsRetriever = SmsRetrieverImpl(
      SmartAuth.instance,
    );
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
    final defaultPinTheme = PinTheme(
      width: AppHeight.h56,
      height: AppHeight.h56,
      textStyle: TextStyle(
        fontSize: 22,
        color: context.colorScheme.onSecondary,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(
          color: context.colorScheme.outline,
          width: AppBorderWeight.md,
        ),
      ),
    );

    return Form(
      key: formKey,
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(AppLayoutGrid.margin),
            child: BlocBuilder<OtpCubit, OtpState>(
              builder: (context, state) {
                return Column(
                  children: [
                    CustomAppBar(
                      haveBackButton: true,
                      title: context.localization.authTitle,
                      subtitle: context.localization.authSubtitle(
                        "+${widget.loginArguments.countryCode}${widget.loginArguments.phoneNumber}",
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sp24),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: Pinput(
                        smsRetriever: smsRetriever,
                        controller: pinController,
                        focusNode: focusNode,
                        defaultPinTheme: defaultPinTheme,
                        separatorBuilder: (index) => const SizedBox(
                          width: AppSpacing.sp8,
                        ),
                        validator: (value) {
                          return value == '2222'
                              ? context.localization.otpCorrect
                              : context.localization.otpIncorrect;
                        },
                        hapticFeedbackType: HapticFeedbackType.lightImpact,
                        onCompleted: (pin) {
                          if (pin == '2222') {
                            Navigator.pushNamedAndRemoveUntil(
                                context,
                                AppRoutes.setBiometricAuthScreen,
                                (Route<dynamic> route) => false);
                          } else {
                            debugPrint('onCompleted: $pin');
                          }
                        },
                        onChanged: (value) {
                          debugPrint('onChanged: $value');
                        },
                        cursor: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin:
                                  const EdgeInsets.only(bottom: AppSpacing.sp8),
                              width: 22,
                              height: 1,
                              color: Colors.transparent,
                            ),
                          ],
                        ),
                        closeKeyboardWhenCompleted: true,
                        focusedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: context.colorScheme.secondary,
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.br8),
                            border:
                                Border.all(color: context.colorScheme.primary),
                          ),
                        ),
                        submittedPinTheme: defaultPinTheme.copyWith(
                          decoration: defaultPinTheme.decoration!.copyWith(
                            color: context.colorScheme.secondary,
                            borderRadius:
                                BorderRadius.circular(AppBorderRadius.br8),
                            border:
                                Border.all(color: context.colorScheme.primary),
                          ),
                        ),
                        errorPinTheme: defaultPinTheme.copyBorderWith(
                          border: Border.all(color: context.colorScheme.error),
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
                              style: context.textTheme.titleLarge!.copyWith(
                                color: context.colorScheme.onSurface,
                              ),
                            ),
                          )
                        : Text(
                            _formatTime(_remainingSeconds),
                            style: context.textTheme.titleMedium!.copyWith(
                              color: context.colorScheme.onSurface,
                              fontSize: 18,
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

class SmsRetrieverImpl implements SmsRetriever {
  const SmsRetrieverImpl(this.smartAuth);

  final SmartAuth smartAuth;

  @override
  Future<void> dispose() {
    return smartAuth.removeSmsRetrieverApiListener();
  }

  @override
  Future<String?> getSmsCode() async {
    final signature = await smartAuth.getAppSignature();
    debugPrint('App Signature: $signature');
    final result = await smartAuth.getSmsWithRetrieverApi();
    if (result.hasData) {
      return result.data!.code;
    }
    return null;
  }

  @override
  bool get listenForMultipleSms => false;
}

// Widget myInputBox(
//   BuildContext context,
//   List<FocusNode> focusNodes,
//   int index,
//   OtpState state,
// ) {
//   return Container(
//     height: AppHeight.h48,
//     width: AppHeight.h48,
//     decoration: BoxDecoration(
//       color: context.colorScheme.secondary,
//       borderRadius: BorderRadius.circular(AppBorderRadius.br12),
//       border: Border.all(
//         color: state.enteredFields.contains(index)
//             ? context.colorScheme.primary
//             : context.colorScheme.outline,
//         width: AppBorderWeight.sm,
//       ),
//     ),
//     child: TextField(
//       focusNode: focusNodes[index],
//       maxLength: 1,
//       textAlign: TextAlign.center,
//       keyboardType: TextInputType.number,
//       style: context.textTheme.titleMedium!.copyWith(
//         color: context.colorScheme.onSecondaryContainer,
//         fontSize: 18,
//       ),
//       decoration: const InputDecoration(
//         counterText: '',
//         border: InputBorder.none,
//       ),
//       onChanged: (value) {
//         if (value.isNotEmpty) {
//           context.read<OtpCubit>().updateField(index);
//           if (index <= focusNodes.length) {
//             if (index - 1 >= 0) {
//               FocusScope.of(context).requestFocus(focusNodes[index - 1]);
//             }
//           } else {
//             focusNodes[index].unfocus();
//           }
//         }
//       },
//     ),
//   );
// }

//floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//         floatingActionButton: CustomFilledButton(
//           buttonText: context.localization.continueButtonTitle,
//           buttonState: ButtonStateEnum.active,
//           onPressed: () {
//             if (kIsWeb) {
//               Navigator.pushNamed(context, AppRoutes.setLocaleScreen);
//             } else {
//               Navigator.pushReplacementNamed(
//                   context, AppRoutes.setBiometricAuthScreen);
//             }
//           },
//         ),
