import 'package:projeto_agenda/app/domain/entities/grades.dart';

abstract class GradesDao {
  Future<List<Grades>> find();
  Future<void> save(Grades grade);
  Future<void> remove(int id);
}
