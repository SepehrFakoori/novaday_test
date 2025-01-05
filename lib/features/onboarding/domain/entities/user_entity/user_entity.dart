
import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypesConstants.userHiveType)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String? fullName;

  @HiveField(1)
  final String? password;

  @HiveField(2)
  final String? jobTitle;

  @HiveField(3)
  final String? profileImage;

  UserEntity({
    this.fullName,
    this.password,
    this.jobTitle,
    this.profileImage,
  });
}
