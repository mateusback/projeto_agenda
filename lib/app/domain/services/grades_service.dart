import 'package:get_it/get_it.dart';
import 'package:projeto_agenda/app/domain/interfaces/grades_dao.dart';

class GradesService {
  var _repository = GetIt.I.get<GradesDao>();
}
