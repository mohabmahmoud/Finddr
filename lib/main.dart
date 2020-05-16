import 'package:flutter/material.dart';
import 'styles/apptheme.dart';
import 'ui/SharedScreen/Splash.dart';
import 'dart:async';

void main() {
  runApp(MaterialApp(debugShowCheckedModeBanner:false,theme:appTheme.apptheme ,home: Splash(),));
}
