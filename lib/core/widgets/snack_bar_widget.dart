import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/app_border_radius.dart';
import 'package:novaday_test/core/constants/app_border_weight.dart';
import 'package:novaday_test/core/constants/app_layout_grid.dart';
import 'package:novaday_test/core/constants/app_spacing.dart';
import 'package:novaday_test/core/extensions/localization_extension.dart';
import 'package:novaday_test/core/extensions/theme_extension.dart';

Flushbar customFlushBar(BuildContext context) {
  return Flushbar(
    messageColor: context.colorScheme.onError,
    messageText: Text(
      context.localization.otpTimeOutError,
      style: TextStyle(
        color: context.colorScheme.onError,
      ),
    ),
    margin: const EdgeInsets.symmetric(horizontal: AppLayoutGrid.margin),
    borderRadius: BorderRadius.circular(AppBorderRadius.br16),
    backgroundColor: context.colorScheme.tertiary,
    borderColor: context.colorScheme.onError,
    borderWidth: AppBorderWeight.lg1,
    icon: const Icon(Icons.cancel, color: Colors.red),
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
