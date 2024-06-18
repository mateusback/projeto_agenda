import 'package:get_it/get_it.dart';
import 'package:projeto_agenda/app/domain/entities/grades.dart';
import 'package:projeto_agenda/app/domain/exception/domain_layer_exception.dart';
import 'package:projeto_agenda/app/domain/interfaces/grades_dao.dart';

class GradesService {
  var _repository = GetIt.I.get<GradesDao>();

  save(Grades grades) {
    validateName(grades.nome!);
    _repository.save(grades);
  }

  remove(int id) {
    _repository.remove(id);
  }

  Future<List<Grades>> find() {
    return _repository.find();
  }

  validateName(String name) {
    if (name == null || name.isEmpty) {
      throw DomainLayerException('O nome é obrigatório');
    } else if (name.length < 3) {
      throw DomainLayerException('O nome deve ter pelo menos 3 caracteres');
    } else if (name.length > 50) {
      throw DomainLayerException('O nome deve ter no máximo 50 caracteres');
    }
  }
}
