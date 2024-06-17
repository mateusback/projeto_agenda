import 'package:get_it/get_it.dart';
import 'package:projeto_agenda/app/database/sqlite/dao/grades_dao_impl.dart';
import 'package:projeto_agenda/app/domain/interfaces/grades_dao.dart';
import 'package:projeto_agenda/app/domain/services/grades_service.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<GradesDao>(GradesDaoImpl());
  getIt.registerSingleton<GradesService>(GradesService());
}
