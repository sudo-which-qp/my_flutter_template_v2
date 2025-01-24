import 'package:hive/hive.dart';

part 'user_model.g.dart';

@HiveType(typeId: 2)
class UserModel {
  @HiveField(1)
  final int? id;

  @HiveField(2)
  final String? uuid;

  @HiveField(3)
  final String? firstName;

  @HiveField(4)
  final String? lastName;

  @HiveField(5)
  final String? userName;

  @HiveField(6)
  final String? email;

  @HiveField(7)
  final String? emailVerified;

  @HiveField(8)
  final int? shouldLiquidate;

  @HiveField(9)
  final int? isSuspended;

  @HiveField(10)
  final String? accountPin;

  @HiveField(11)
  final String? notificationToken;

  @HiveField(12)
  final String? accessToken;

  @HiveField(13)
  final String? lastLogin;

  UserModel({
    this.id,
    this.uuid,
    this.firstName,
    this.lastName,
    this.userName,
    this.email,
    this.emailVerified,
    this.shouldLiquidate,
    this.isSuspended,
    this.accountPin,
    this.notificationToken,
    this.lastLogin,
    this.accessToken,
  });


  factory UserModel.fromJsonLocalToken(responseData) {
    return UserModel(
      accessToken: responseData['data']['token'],
    );
  }

  factory UserModel.fromJsonUserDetails(responseData) {
    return UserModel(
      id: responseData['data']['user']['id'],
      uuid: responseData['data']['user']['uuid'],
      firstName: responseData['data']['user']['first_name'],
      lastName: responseData['data']['user']['last_name'],
      userName: responseData['data']['user']['username'],
      email: responseData['data']['user']['email'],
      emailVerified: responseData['data']['user']['email_verified_at'],
      shouldLiquidate: responseData['data']['user']['should_liquidate'],
      isSuspended: responseData['data']['user']['is_suspended'],
      accountPin: responseData['data']['user']['account_pin'],
      notificationToken: responseData['data']['user']['notification_token'],
      lastLogin: responseData['data']['user']['last_login'],
    );
  }
}