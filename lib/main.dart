import 'dart:async';
import 'package:diploy_assignment/bootstrap.dart';
import 'package:diploy_assignment/core/app/app.dart';
import 'package:diploy_assignment/injection_container.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  unawaited(bootstrap(() => const App()));
}
