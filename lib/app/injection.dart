import 'package:get_it/get_it.dart';
import 'package:projeto_agenda/app/database/sqlite/dao/grades_dao_impl.dart';
import 'package:projeto_agenda/app/domain/interfaces/grades_dao.dart';

setupInjection() {
  GetIt getIt = GetIt.I;
  getIt.registerSingleton<GradesDao>(GradesDaoImpl());
}
