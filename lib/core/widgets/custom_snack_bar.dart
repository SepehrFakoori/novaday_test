import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

Flushbar customFlushBar(BuildContext context,
    {required String messageText, required bool isError}) {
  //context.localization.otpTimeOutError
  return Flushbar(
    messageColor: context.colorScheme.onError,
    messageText: Text(
      messageText,
      style: context.textTheme.bodyMedium!.copyWith(
        fontWeight: FontWeight.w600,
        color: isError
            ? context.colorScheme.onError
            : context.colorScheme.surfaceTint,
      ),
    ),
    margin: const EdgeInsets.symmetric(horizontal: AppLayoutGrid.margin),
    borderRadius: BorderRadius.circular(AppBorderRadius.br16),
    backgroundColor: context.colorScheme.tertiary,
    borderColor:
        isError ? context.colorScheme.onError : context.colorScheme.surfaceTint,
    borderWidth: AppBorderWeight.lg1,
    icon: isError
        ? Icon(
            Icons.cancel,
            color: context.colorScheme.onError,
          )
        : Icon(
            Icons.check,
            color: context.colorScheme.surfaceTint,
          ),
    shouldIconPulse: false,
    padding: const EdgeInsets.symmetric(
      horizontal: AppSpacing.sp12,
      vertical: AppSpacing.sp12,
    ),
    flushbarStyle: FlushbarStyle.FLOATING,
    flushbarPosition: FlushbarPosition.TOP,
    dismissDirection: FlushbarDismissDirection.HORIZONTAL,
    duration: const Duration(seconds: 3),
  )..show(context);
}
