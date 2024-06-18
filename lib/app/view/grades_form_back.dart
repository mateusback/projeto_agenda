import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_agenda/app/domain/entities/grades.dart';

part 'grades_form_back.g.dart';

class GradesFormBack = _GradesFormBack with _$GradesFormBack;

abstract class _GradesFormBack with Store {
  Grades? grade;

  _GradesFormBack(BuildContext context) {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    grade = (parameter == null) ? Grades() : parameter as Grades;
  }
}
