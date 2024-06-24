import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/injection.dart';
import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());
}
