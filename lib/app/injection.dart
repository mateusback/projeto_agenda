import 'package:projeto_agenda/app/domain/interfaces/contact_dao.dart';
import 'package:projeto_agenda/app/domain/services/contact_service.dart';
import 'database/sqlite/dao/contact_dao_impl.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

setupInjection() async {
  GetIt getIt = GetIt.I;

  WidgetsFlutterBinding.ensureInitialized();
  getIt.registerSingleton<ContactDAO>(ContactDAOImpl());
  getIt.registerSingleton<ContactService>(ContactService());
}
