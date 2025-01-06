import 'package:hive/hive.dart';
import 'package:novaday_test/core/constants/hive_constants/hive_constants.dart';

part 'user_entity.g.dart';

@HiveType(typeId: HiveTypesConstants.userHiveType)
class UserEntity extends HiveObject {
  @HiveField(0)
  final String? fullName;

  @HiveField(1)
  String? phoneNumber;

  @HiveField(2)
  final String? password;

  @HiveField(3)
  final String? jobTitle;

  @HiveField(4)
  final String? profileImage;

  UserEntity({
    this.fullName,
    this.phoneNumber,
    this.password,
    this.jobTitle,
    this.profileImage,
  });

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
        fullName: json['fullName'],
        phoneNumber: json['phoneNumber'],
        password: json['password'],
        jobTitle: json['jobTitle'],
        profileImage: json['profileImage'],
      );

  Map<String, dynamic> toJson() => {
        "fullName": fullName,
        "phoneNumber": phoneNumber,
        "password": password,
        "jobTitle": jobTitle,
        "profileImage": profileImage,
      };
}
