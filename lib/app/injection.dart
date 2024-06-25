import 'package:firebase_core/firebase_core.dart';
import 'package:projeto_agenda/app/database/sqlite/firestore/contact_dao_firestore.dart';
import 'package:projeto_agenda/app/domain/interfaces/contact_dao.dart';
import 'package:projeto_agenda/app/domain/services/contact_service.dart';
import 'package:projeto_agenda/firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  getIt.registerSingleton<ContactDAO>(ContactDaoFirestore());
  getIt.registerSingleton<ContactService>(ContactService());
}
