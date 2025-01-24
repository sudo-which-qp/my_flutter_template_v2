import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_flutter_template_v2/data/models/user/user_model.dart';
import 'package:my_flutter_template_v2/utils/const_values.dart';
import 'package:path_provider/path_provider.dart';

class HiveManager {
  static final HiveManager _instance = HiveManager._internal();

  factory HiveManager() {
    return _instance;
  }

  HiveManager._internal();

  static late Box<UserModel> _userModelBox;

  Future<void> init() async {
    Directory directory = await getApplicationDocumentsDirectory();
    Hive
      ..init(directory.path)
      ..registerAdapter(UserModelAdapter());
    _userModelBox = await Hive.openBox<UserModel>(userBox);

  }

  Box<UserModel> get userModelBox => _userModelBox;

}