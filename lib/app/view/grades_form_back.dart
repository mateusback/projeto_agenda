import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:projeto_agenda/app/domain/entities/grades.dart';
import 'package:projeto_agenda/app/domain/services/grades_service.dart';

part 'grades_form_back.g.dart';

class GradesFormBack = _GradesFormBack with _$GradesFormBack;

abstract class _GradesFormBack with Store {
  Grades? grade;
  var _service = GetIt.I.get<GradesService>();
  bool _isNameValid;
  bool _isNotaValid;

  @action
  IsFormValid() {
    return _isNameValid && _isNotaValid;
  }

  _GradesFormBack(BuildContext context)
      : _isNameValid = false,
        _isNotaValid = false {
    var parameter = ModalRoute.of(context)!.settings.arguments;
    grade = ((parameter == null) ? Grades() : parameter) as Grades?;
  }

  save() async {
    await _service.save(grade!);
  }

  String? validateName(String name) {
    try {
      _service.validateName(name);
      _isNameValid = true;
      return null;
    } catch (e) {
      _isNameValid = false;
      return e.toString();
    }
  }

  String? validateNota(double nota) {
    try {
      _service.validateNota(nota);
      _isNotaValid = true;
      return null;
    } catch (e) {
      _isNotaValid = false;
      return e.toString();
    }
  }
}
