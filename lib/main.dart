import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projeto_agenda/app/injection.dart';
import 'package:projeto_agenda/firebase_options.dart';
import 'app/my_app.dart';

void main() async {
  setupInjection();
  runApp(MyApp());
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseFirestore.instance.collection('contact').doc().set({
    'name': 'Joaquim',
    'phone': '(11) 9 98529632',
    'email': 'joaqui@email.com',
  });
}
