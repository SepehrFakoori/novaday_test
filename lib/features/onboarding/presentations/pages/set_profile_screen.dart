import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';

class SetProfileScreen extends StatefulWidget {
  const SetProfileScreen({super.key});

  @override
  State<SetProfileScreen> createState() => _SetProfileScreenState();
}

class _SetProfileScreenState extends State<SetProfileScreen> {
  final imagePicker = ImagePicker();
  late FocusNode _focusNode;
  String pickedImage = '';

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
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(AppLayoutGrid.margin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(
                  title: context.localization.completeProfile,
                  haveBackButton: false,
                ),
                const SizedBox(height: AppSpacing.sp16),
                pickedImage.isNotEmpty
                    ? Stack(
                        alignment: Alignment.bottomRight,
                        children: [
                          SizedBox(
                            width: AppHeight.h96,
                            height: AppHeight.h96,
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.br48),
                                border: Border.all(
                                    color: context.colorScheme.outline),
                              ),
                              child: ClipRRect(
                                borderRadius:
                                    BorderRadius.circular(AppBorderRadius.br48),
                                child: Image.file(
                                  File(pickedImage),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              final pickedFile = await imagePicker.pickImage(
                                  source: ImageSource.gallery);
                              if (pickedFile != null) {
                                setState(() {
                                  pickedImage = pickedFile.path;
                                });
                              } else {
                                setState(() {
                                  pickedImage = '';
                                });
                              }
                            },
                            child: Container(
                              width: AppHeight.h36,
                              height: AppHeight.h36,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: context.colorScheme.onPrimary,
                                border: Border.all(
                                    color: context.colorScheme.outline),
                              ),
                              child: Icon(
                                Icons.add,
                                size: AppHeight.h20,
                                color: context.colorScheme.onSecondary,
                              ),
                            ),
                          ),
                        ],
                      )
                    : GestureDetector(
                        onTap: () async {
                          final pickedFile = await imagePicker.pickImage(
                              source: ImageSource.gallery);
                          if (pickedFile != null) {
                            setState(() {
                              pickedImage = pickedFile.path;
                            });
                          } else {
                            setState(() {
                              pickedImage = '';
                            });
                          }
                        },
                        child: Container(
                          width: AppHeight.h96,
                          height: AppHeight.h96,
                          decoration: BoxDecoration(
                            color: context.colorScheme.secondary,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: context.colorScheme.outline,
                            ),
                          ),
                          child: Icon(
                            Icons.add,
                            size: AppHeight.h40,
                            color: context.colorScheme.onSecondary,
                          ),
                        ),
                      ),
                const SizedBox(height: AppSpacing.sp40),
                CustomTextField(
                  labelText: context.localization.firstNameAndLastName,
                  hasFocus: _focusNode.hasFocus,
                ),
                const SizedBox(height: AppSpacing.sp16),
                CustomTextField(
                  labelText: context.localization.password,
                  hasFocus: _focusNode.hasFocus,
                ),
                const SizedBox(height: AppSpacing.sp16),
                CustomTextField(
                  labelText: context.localization.jobTitle,
                  hasFocus: _focusNode.hasFocus,
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFilledButton(
        buttonText: context.localization.continueButtonTitle,
        buttonState: ButtonStateEnum.deActive,
        onPressed: () {},
      ),
    );
  }
}
