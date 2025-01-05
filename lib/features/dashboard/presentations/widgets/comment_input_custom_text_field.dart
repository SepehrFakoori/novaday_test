import 'package:flutter/material.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/extensions/extensions.dart';

class CommentInputCustomTextField extends StatefulWidget {
  const CommentInputCustomTextField({
    super.key,
  });

  @override
  State<CommentInputCustomTextField> createState() =>
      _CommentInputCustomTextFieldState();
}

class _CommentInputCustomTextFieldState
    extends State<CommentInputCustomTextField> {
  late FocusNode focusNode;
  late TextEditingController controller = TextEditingController();

  bool hasFocus = false;

  @override
  void initState() {
    super.initState();
    controller.addListener(updateIconVisibility);
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.removeListener(updateIconVisibility);
    super.dispose();
  }

  void updateIconVisibility() {
    setState(() {});
  }

  void focusChanger() {
    if (focusNode.hasFocus) {
      setState(() {
        hasFocus = true;
      });
    } else {
      setState(() {
        hasFocus = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textAlign: TextAlign.start,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: TextInputType.multiline,
      minLines: 1,
      maxLines: 6,
      style: context.textTheme.titleMedium!.copyWith(
        color: context.colorScheme.onSecondary,
        fontSize: 18,
      ),
      enableSuggestions: false,
      decoration: InputDecoration(
        filled: true,
        fillColor: context.colorScheme.secondary,
        hintText: context.localization.message,
        hintStyle: context.textTheme.titleMedium!.copyWith(
          color: context.colorScheme.onSecondaryContainer,
          fontSize: 18,
        ),
        contentPadding: const EdgeInsets.all(AppSpacing.sp8),
        suffixIcon: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: controller.text.isNotEmpty
                ? context.colorScheme.primary
                : context.colorScheme.tertiaryContainer,
          ),
        ),
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
      ),
    );
  }
}
