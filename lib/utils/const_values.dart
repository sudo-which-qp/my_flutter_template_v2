import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:my_flutter_template_v2/utils/contants/api_constant.dart';
import 'package:my_flutter_template_v2/utils/tools/hex_to_color.dart';

var logger = Logger();

String apiUrl = ApiConstants.apiUrl;

// Hive details
const String noteBox = 'notebox';
const String cloudNoteBox = 'cloudNoteBox';
const String userBox = 'userBox';
const String deletedNotes = 'deletedNotes';
const String appHiveKey = 'state';
const String deleteNote = 'deleteNote';


const String userKey = 'userKey';
const String tokenKey = 'tokenKey';

Color transparent = Colors.transparent;
Color grey = hexToColor('#AFACAB');
Color mGrey = grey.withOpacity(0.4);