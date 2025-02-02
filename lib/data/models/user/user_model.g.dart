// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 2;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      id: fields[1] as int?,
      uuid: fields[2] as String?,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      userName: fields[5] as String?,
      email: fields[6] as String?,
      emailVerified: fields[7] as String?,
      shouldLiquidate: fields[8] as int?,
      isSuspended: fields[9] as int?,
      accountPin: fields[10] as String?,
      notificationToken: fields[11] as String?,
      lastLogin: fields[13] as String?,
      accessToken: fields[12] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.uuid)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.userName)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.emailVerified)
      ..writeByte(8)
      ..write(obj.shouldLiquidate)
      ..writeByte(9)
      ..write(obj.isSuspended)
      ..writeByte(10)
      ..write(obj.accountPin)
      ..writeByte(11)
      ..write(obj.notificationToken)
      ..writeByte(12)
      ..write(obj.accessToken)
      ..writeByte(13)
      ..write(obj.lastLogin);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
