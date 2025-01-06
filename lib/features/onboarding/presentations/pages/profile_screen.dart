import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:novaday_test/core/constants/constants.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';
import 'package:novaday_test/core/enums/NavigateProfileFromEnum.dart';
import 'package:novaday_test/core/enums/enums.dart';
import 'package:novaday_test/core/extensions/extensions.dart';
import 'package:novaday_test/core/widgets/widgets.dart';
import 'package:novaday_test/features/onboarding/domain/entities/user_entity/user_entity.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key, required this.navigateFrom});

  final NavigateProfileFromEnum navigateFrom;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  /// Check from directory
  bool isFromOtpScreen = true;

  /// Text editing controllers
  late final TextEditingController fullNameController;
  late final TextEditingController phoneController;
  late final TextEditingController passwordController;
  late final TextEditingController jobTitleController;

  /// FocusNodes
  final FocusNode fullNameFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode jobTitleFocusNode = FocusNode();

  /// button state
  ButtonStateEnum buttonState = ButtonStateEnum.deActive;

  /// Dispose Controllers
  void disposeControllers() {
    fullNameController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    jobTitleController.dispose();
  }

  /// Dispose FocusNodes
  void disposeFocusNodes() {
    fullNameFocusNode.dispose();
    passwordFocusNode.dispose();
    jobTitleFocusNode.dispose();
  }

  final imagePicker = ImagePicker();
  String pickedImage = '';
  String userProfile = '';

  @override
  void initState() {
    super.initState();
    UserEntity user = getUser();

    userProfile = user.profileImage ?? '';
    phoneController = TextEditingController(text: user.phoneNumber);

    /// Initialize TextEditingControllers
    fullNameController = TextEditingController(
        text: widget.navigateFrom == NavigateProfileFromEnum.dashboard
            ? user.fullName
            : null);
    passwordController = TextEditingController(
        text: widget.navigateFrom == NavigateProfileFromEnum.dashboard
            ? user.password
            : null);
    jobTitleController = TextEditingController(
        text: widget.navigateFrom == NavigateProfileFromEnum.dashboard
            ? user.jobTitle
            : null);

    /// Add listeners to check when text fields are filled
    fullNameController.addListener(_checkFields);
    passwordController.addListener(_checkFields);

    /// Autofocus the full name text field when the screen is opened
    widget.navigateFrom == NavigateProfileFromEnum.onboarding
        ? WidgetsBinding.instance.addPostFrameCallback(
            (_) {
              fullNameFocusNode.requestFocus();
            },
          )
        : null;
  }

  @override
  void dispose() {
    disposeControllers();
    disposeFocusNodes();
    super.dispose();
  }

  UserEntity getUser() {
    var box = Hive.box<UserEntity>(HiveBoxConstants.userProfileBox);
    UserEntity? user = box.get(HiveKeyConstants.userProfileKey);
    return user ??
        UserEntity(
          phoneNumber: '0000000000',
          profileImage: '',
        );
  }

  /// Check full name and password text fields are filled
  void _checkFields() {
    setState(() {
      buttonState = (fullNameController.text.isNotEmpty &&
              passwordController.text.isNotEmpty)
          ? ButtonStateEnum.active
          : ButtonStateEnum.deActive;
    });
  }

  /// Handle focusNodes
  void _onFieldSubmitted(
    String value,
    FocusNode currentNode,
    FocusNode nextNode,
  ) {
    currentNode.unfocus();
    nextNode.requestFocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                  widget.navigateFrom == NavigateProfileFromEnum.onboarding
                      ? pickedImage.isNotEmpty
                          ? Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                SizedBox(
                                  width: AppHeight.h96,
                                  height: AppHeight.h96,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          AppBorderRadius.br48),
                                      border: Border.all(
                                        color: context.colorScheme.primary,
                                        width: AppBorderWeight.lg1,
                                      ),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          AppBorderRadius.br48),
                                      child: Image.file(
                                        File(pickedImage),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    final pickedFile = await imagePicker
                                        .pickImage(source: ImageSource.gallery);
                                    if (pickedFile != null) {
                                      setState(() {
                                        pickedImage = pickedFile.path;
                                      });
                                    }
                                  },
                                  child: Container(
                                    width: AppHeight.h36,
                                    height: AppHeight.h36,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: context.colorScheme.secondary,
                                      border: Border.all(
                                        color: context.colorScheme.outline,
                                      ),
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
                            )
                      : userProfile.isNotEmpty
                          ? pickedImage.isEmpty
                              ? Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                      width: AppHeight.h96,
                                      height: AppHeight.h96,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            AppBorderRadius.br48,
                                          ),
                                          border: Border.all(
                                            color: context.colorScheme.primary,
                                            width: AppBorderWeight.lg1,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppBorderRadius.br48),
                                          child: Image.file(
                                            File(userProfile),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final pickedFile =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          setState(() {
                                            pickedImage = pickedFile.path;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: AppHeight.h36,
                                        height: AppHeight.h36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colorScheme.secondary,
                                          border: Border.all(
                                            color: context.colorScheme.outline,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: AppHeight.h20,
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                      width: AppHeight.h96,
                                      height: AppHeight.h96,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            AppBorderRadius.br48,
                                          ),
                                          border: Border.all(
                                            color: context.colorScheme.primary,
                                            width: AppBorderWeight.lg1,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppBorderRadius.br48),
                                          child: Image.file(
                                            File(pickedImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final pickedFile =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          setState(() {
                                            pickedImage = pickedFile.path;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: AppHeight.h36,
                                        height: AppHeight.h36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colorScheme.secondary,
                                          border: Border.all(
                                            color: context.colorScheme.outline,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: AppHeight.h20,
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                          : pickedImage.isEmpty
                              ? Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                      width: AppHeight.h96,
                                      height: AppHeight.h96,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            AppBorderRadius.br48,
                                          ),
                                          border: Border.all(
                                            color: context.colorScheme.primary,
                                            width: AppBorderWeight.lg1,
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            fullNameController.text[0]
                                                .toUpperCase(),
                                            style: context
                                                .textTheme.headlineSmall!
                                                .copyWith(
                                              fontSize: 30,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final pickedFile =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          setState(() {
                                            pickedImage = pickedFile.path;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: AppHeight.h36,
                                        height: AppHeight.h36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colorScheme.secondary,
                                          border: Border.all(
                                            color: context.colorScheme.outline,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: AppHeight.h20,
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              : Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    SizedBox(
                                      width: AppHeight.h96,
                                      height: AppHeight.h96,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: context.colorScheme.primary,
                                          borderRadius: BorderRadius.circular(
                                            AppBorderRadius.br48,
                                          ),
                                          border: Border.all(
                                            color: context.colorScheme.primary,
                                            width: AppBorderWeight.lg1,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(
                                              AppBorderRadius.br48),
                                          child: Image.file(
                                            File(pickedImage),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () async {
                                        final pickedFile =
                                            await imagePicker.pickImage(
                                                source: ImageSource.gallery);
                                        if (pickedFile != null) {
                                          setState(() {
                                            pickedImage = pickedFile.path;
                                          });
                                        }
                                      },
                                      child: Container(
                                        width: AppHeight.h36,
                                        height: AppHeight.h36,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: context.colorScheme.secondary,
                                          border: Border.all(
                                            color: context.colorScheme.outline,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          size: AppHeight.h20,
                                          color:
                                              context.colorScheme.onSecondary,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                  const SizedBox(height: AppSpacing.sp40),
                  CustomTextField(
                    controller: fullNameController,
                    focusNode: fullNameFocusNode,
                    labelText: context.localization.fullName,
                    textInputType: TextInputType.name,
                    onFieldSubmitted: widget.navigateFrom ==
                            NavigateProfileFromEnum.onboarding
                        ? (value) => _onFieldSubmitted(
                            value, fullNameFocusNode, passwordFocusNode)
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.sp16),
                  CustomTextField(
                    controller: phoneController,
                    focusNode: FocusNode(),
                    labelText: context.localization.phoneNumber,
                    textInputType: TextInputType.name,
                    readOnly: true,
                  ),
                  const SizedBox(height: AppSpacing.sp16),
                  CustomTextField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    labelText: context.localization.password,
                    isPassword: true,
                    textInputType: TextInputType.visiblePassword,
                    onFieldSubmitted: (value) => widget.navigateFrom ==
                            NavigateProfileFromEnum.onboarding
                        ? _onFieldSubmitted(
                            value, passwordFocusNode, jobTitleFocusNode)
                        : null,
                  ),
                  const SizedBox(height: AppSpacing.sp16),
                  CustomTextField(
                    controller: jobTitleController,
                    focusNode: jobTitleFocusNode,
                    labelText: context.localization.jobTitle,
                    textInputType: TextInputType.text,
                    onFieldSubmitted: (value) => jobTitleFocusNode.unfocus(),
                  ),
                ],
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: CustomFilledButton(
          buttonText: context.localization.continueButtonTitle,
          buttonState: buttonState,
          onPressed: () {
            var box = Hive.box<UserEntity>(HiveBoxConstants.userProfileBox);
            box
                .put(
              HiveKeyConstants.userProfileKey,
              UserEntity(
                fullName: fullNameController.text,
                phoneNumber: phoneController.text,
                password: passwordController.text,
                jobTitle: jobTitleController.text,
                profileImage: pickedImage.toString(),
              ),
            )
                .then(
              (_) {
                if (context.mounted) {
                  customFlushBar(context, messageText: 'Done', isError: false);
                }
              },
            );
          },
        ),
      ),
    );
  }
}
