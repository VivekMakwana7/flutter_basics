import 'package:flutter/material.dart';
import 'package:flutter_basics/app.dart';
import 'package:flutter_basics/core/config/app_config.dart';

void main() {
  AppConfig.instance.initialise();
  runApp(const MyApp());
}
